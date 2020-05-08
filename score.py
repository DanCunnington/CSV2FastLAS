import argparse
import re

def main(args):
    learned_hyp_file_path = args.learned_hyp_file
    test_examples_path = args.test_examples
    predictor_pos_value = args.predictor_positive_value

    # Take in learned hypothesis, test las file and generate F1 score and accuracy
    # over the test examples.
    learned_hyp_file = open(learned_hyp_file_path, "r").read()
    test_examples_file = open(test_examples_path, "r").read().split("% Background Knowledge")[0].split("% Examples")[1]


    # Extract examples using RegEX
    r_str = '(#pos\(.*, {)(((\s*)+[^\)|\}]+\)\.)+)'
    matches = re.findall(r_str, test_examples_file)

    positive_examples = []
    negative_examples = []
    for m in matches:
        pos_or_neg_str = m[0].split(',')
        features_and_values = m[1]
        
        # Remove whitespace
        r_str = re.compile(r'\s+')
        features_and_values = re.sub(r_str, '', features_and_values).split('.')
        example = {}

        for fv in features_and_values:
            if fv != '':
                feature = fv.split('(')[0]
                value = fv.split('(')[1].split(')')[0]
                example[feature] = value
        
        if predictor_pos_value in pos_or_neg_str[1]:
            positive_examples.append(example)
        else:
            negative_examples.append(example)
    
    # Build rules
    rules_for_accept = []
    r_str = '(attack :- )([^\.]+)'
    matches = re.findall(r_str, learned_hyp_file)
    for rule in matches:
        to_check = {}
        features_and_values = rule[1].split(', ')
        for fv in features_and_values:
            feature = fv.split('(')[0]
            value = fv.split('(')[1].split(')')[0]
            to_check[feature] = value

        rules_for_accept.append(to_check)
    
    # For each positive example, compute prediction based on rules for accept
    def calculate_results(examples):
        predictions = []
        for ex in examples: 
            rule_results = []
            for r in rules_for_accept:
                rule_fail = False
                for idx,k in enumerate(r):
                    target = r[k]
                    if ex[k] != target:
                        rule_fail = True
                rule_results.append(not rule_fail)

            # If any results are true, this means accept
            predictions.append(any(rule_results))
        return predictions

    positive_predictions = calculate_results(positive_examples)
    negative_predictions = calculate_results(negative_examples)

    # Calculate F1 Score
    tp = sum(positive_predictions)
    fn = len(positive_predictions) - tp
    fp = sum(negative_predictions)
    tn = len(negative_predictions) - fp

    precision = tp / (tp + fp)
    recall = tp  / (tp + fn)
    f1 = 2 * ((precision*recall) / (precision + recall))

    # Calculate Accuracy
    accuracy = (tp + tn) / (tp + tn + fp + fn)

    print('Number of Positive Examples: ', len(positive_examples))
    print('Number of Negative Examples: ', len(negative_examples))
    print('Precision: ', precision)
    print('Recall: ', recall)
    print('F1 Score: ', f1)
    print('Accuracy: ', accuracy)
    

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Score a learned hypothesis over test examples')
    parser.add_argument('learned_hyp_file', help='The learned hypothesis file to score against')
    parser.add_argument('test_examples', help='The .las file containing the test examples')
    parser.add_argument('--predictor_positive_value', 
        help='The value of the predictor for a positive class in binary classification (default: accept).',
        default='accept')
    
    args = parser.parse_args()
    main(args)
