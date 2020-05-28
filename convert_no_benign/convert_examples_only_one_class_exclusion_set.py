import sys
import ast
import math
import argparse
import pandas as pd
import numpy as np

def main(args):
    predictor = args.predictor
    columns = args.feature_columns
    csv_file_path = args.csv_file
    sf_name = args.scoring_function
    predictor_pos_value = args.predictor_positive_value
    maxv = args.maxv
    noise = args.noise

    # Validate columns
    if columns != '*':
        try:
            list_cols = ast.literal_eval(columns)
            list_col_ints = [int(x) for x in list_cols]
            columns = list_col_ints
                      
        except Exception as e:    
            print('Error: Please specify columns as a JSON array or *')
            sys.exit(0)

    # Load file
    csv_file = pd.read_csv(csv_file_path)

    # Transform strings to lower case
    csv_file = csv_file.applymap(lambda s:s.lower() if type(s) == str else s)

    # Transform floats to integers
    csv_file = csv_file.applymap(lambda f:math.floor(f*100000) if type(f) == float else f)

    # Extract features and predictor
    if columns == '*':
        features = csv_file.loc[:, csv_file.columns != predictor]
    else:
        features = csv_file.iloc[:, columns]
    labels = csv_file[predictor].astype(str)

    # Check whether the problem is multi class
    multi_class = False
    if len(labels.unique()) > 2:
        multi_class = True

    # Setup arrays
    background_knowledge = []
    scoring_function = []
    constants = []
    mode_declarations = ['#maxv({0}).'.format(maxv)]

    # Background Knowledge
    if multi_class:
        background_knowledge.append(':- class(X), class(Y), X < Y.')

    # Extract feature names and predicates
    df_feature_names = []
    predicates = []
    for col in features.columns.values:
        df_feature_names.append(col)
        predicates.append(col.replace(' ','_').lower())

    # Head mode declarations
    if not multi_class:
        mode_declarations.append('#modeh({0}).'.format(predictor_pos_value))
    else:
        mode_declarations.append('#modeh(class(const(class))).')

    # Construct constants and body mode declarations
    for p_idx, p in enumerate(predicates):
        mode_declarations.append('#modeb(1, {0}(const({0}))).'.format(p))
        unique_values = features[df_feature_names[p_idx]].unique()
        for u in unique_values:
            constants.append('#constant({0}, {1}).'.format(p, u))
    if multi_class:
        for l in np.unique(labels):
            if 'benign' not in l:
                constants.append('#constant(class, {0}).'.format(l))
    
    # Examples
    def construct_inner(row):
            ex_str_inner = ''
            for p_idx, p in enumerate(predicates):
                ex_str_inner += '\t{0}({1}).\n'.format(p, row[p_idx])
            return ex_str_inner

    # Coverage scoring function additions
    def add_to_cov_sf(row, row_idx):
        scoring_function.append('#bias("pos_example(eg(id{0})) :- not n(eg(id{0})).").'.format(row_idx))
        for p_idx, p in enumerate(predicates):
            scoring_function.append('#bias("n(eg(id{0})) :- in_body({1}(V)), V != {2}.").'.format(row_idx, p, row[p_idx]))

    def add_to_cov_sf_multi_class(row, row_idx, class_id):
        scoring_function.append('#bias("pos_example(eg(id{0})) :- in_head(class({1})), not n(eg(id{0})).").'.format(row_idx, class_id))
        for p_idx, p in enumerate(predicates):
            scoring_function.append('#bias("n(eg(id{0})) :- in_body({1}(V)), V != {2}.").'.format(row_idx, p, row[p_idx]))

    if not multi_class:
        mask = labels == str(predictor_pos_value)
        positive_ex_features = features[mask]
        negative_ex_features = features[~mask]

        def construct_example(row, row_idx, positive):
            if positive:
                ex = '#pos(eg(id{0})@{1}, {{ {2} }}, {{ }}, {{\n'.format(row_idx, noise, predictor_pos_value)
            else:
                ex = '#pos(eg(id{0})@{1}, {{ }}, {{ {2} }}, {{\n'.format(row_idx, noise, predictor_pos_value)

            ex += construct_inner(row)

            ex += f'}}).'

            if sf_name == 'cov' and positive:
                add_to_cov_sf(row, row_idx)
            return ex
        
        positive_examples = [construct_example(row, idx, True) for idx, row in enumerate(positive_ex_features[df_feature_names].values)]
        amount_neg_examples = len(positive_ex_features[df_feature_names].values)
        negative_examples = [construct_example(row, idx+amount_neg_examples, False) for idx, row in enumerate(negative_ex_features[df_feature_names].values)]

        examples = positive_examples + negative_examples
    else:
        unique_labels = np.unique(labels)
        def construct_multi_class_example(row, row_idx, positive):
            class_id = labels[row_idx]

            # Build non classes for exclusion set
            non_label_mask = unique_labels != class_id
            non_class_ids = unique_labels[non_label_mask]
            examples_to_return = []
            for ncidx, ncid in enumerate(non_class_ids):
                new_row_idx = str(row_idx) + '_' + str(ncidx)
                if 'benign' not in ncid:
                    ncs = 'class({0})'.format(ncid)
                    
                    if 'benign' not in class_id:
                        ex = '#pos(eg(id{0})@{1}, {{ class({2}) }}, {{ {3} }}, {{\n'.format(new_row_idx, noise, class_id, ncs)
                    else:
                        ex = '#pos(eg(id{0})@{1}, {{ }}, {{ {2} }}, {{\n'.format(new_row_idx, noise, ncs)

                    ex += construct_inner(row)

                    ex += f'}}).'

                    examples_to_return.append(ex)

                if sf_name == 'cov' and positive:
                    add_to_cov_sf_multi_class(row, new_row_idx, class_id)

            return examples_to_return

        examples = []
        for idx, row in enumerate(features[df_feature_names].values):
            examples = examples + construct_multi_class_example(row, idx, True)

    # Scoring Function
    # Length function specified here
    # TODO others
    if sf_name == 'len':
        scoring_function.append('#bias("penalty(1, head(X)) :- in_head(X).").')
        scoring_function.append('#bias("penalty(1, body(X)) :- in_body(X).").')
    elif sf_name == 'cov':
        scoring_function.append('#bias("penalty(1,ID) :- pos_example(ID).").')
        scoring_function.append('#bias(":- not penalty(1, _).").')
        scoring_function.append('#bias("invert(1000).").')


    # Print to std out
    print('% Examples')
    for e in examples:
        print(e)

    print()
    print('% Background Knowledge')
    for b in background_knowledge:
        print(b)

    print()
    print('% Constants')
    for c in constants:
        print(c)

    print()
    print('% Mode Declarations')
    for m in mode_declarations:
        print(m)

    print()
    print('% Scoring Function')
    for s in scoring_function:
        print(s)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Convert CSV data to a FastLAS learning task. The output is returned using stdout.')
    parser.add_argument('csv_file', help='The CSV file to convert')
    parser.add_argument('predictor', help='The name of the predictor column.')
    parser.add_argument('--feature_columns', default='*',
        help='Which columns to convert. Specify as a JSON array of 0 indexed '\
             'column indexes, e.g. "[0,1,4]". Alternatively, specify "*" for all columns (default: *)')
    parser.add_argument('--predictor_positive_value', 
        help='The value of the predictor for a positive class in binary classification (default: accept).',
        default='accept')
    parser.add_argument('--scoring_function', help='The scoring function to use (default: len).', default='len')
    parser.add_argument('--maxv', help='The maximum number of variables '\
        'to allow in the body of learned rules (default: 1).', default=1)
    parser.add_argument('--noise', help='The noise weight for each example (default: 1000).', default=1000)
    
    args = parser.parse_args()
    main(args)
