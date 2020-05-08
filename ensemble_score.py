import re
import argparse

# Take in three learned hypothesis files, test examples and calculate combination policy results

def build_rules(hyp):
    # Build rules
    rules_for_accept = []
    r_str = '(attack :- )([^\.]+)'
    matches = re.findall(r_str, hyp)
    for rule in matches:
        to_check = {}
        features_and_values = rule[1].split(', ')
        for fv in features_and_values:
            feature = fv.split('(')[0]
            value = fv.split('(')[1].split(')')[0]
            to_check[feature] = value

        rules_for_accept.append(to_check)
    return rules_for_accept


def predict(example, hyp_rules_for_accpet):
    rule_results = []
    for r in hyp_rules_for_accpet:
        rule_fail = False
        for idx,k in enumerate(r):
            target = r[k]
            if example[k] != target:
                rule_fail = True
        rule_results.append(not rule_fail)

    # If any results are true, this means accept
    return any(rule_results)


def policy_prediction(pred_a, pred_b, pred_c, test_examples_type):
    d1_frac_icmp = 0.96
    d1_frac_tcp = 0
    d1_frac_udp = 0.04

    d2_frac_icmp = 0
    d2_frac_tcp = 1
    d2_frac_udp = 0

    d3_frac_icmp = 0
    d3_frac_tcp = 0.04
    d3_frac_udp = 0.96

    if test_examples_type == 'icmp':
        frac_a = d1_frac_icmp
        frac_b = d1_frac_tcp
        frac_c = d1_frac_udp
    elif test_examples_type == 'tcp':
        frac_a = d2_frac_icmp
        frac_b = d2_frac_tcp
        frac_c = d2_frac_udp
    elif test_examples_type == 'udp':
        frac_a = d3_frac_icmp
        frac_b = d3_frac_tcp
        frac_c = d3_frac_udp

    return (frac_a*pred_a + frac_b*pred_b + frac_c*pred_c) / (frac_a + frac_b + frac_c)

def main(args):
    learned_hyp_file_1_path = args.learned_hyp_file_1
    learned_hyp_file_2_path = args.learned_hyp_file_2
    learned_hyp_file_3_path = args.learned_hyp_file_3
    test_examples_path = args.test_examples
    predictor_pos_value = args.predictor_positive_value
    test_examples_type = args.test_examples_type


    learned_hyp_file_1 = open(learned_hyp_file_1_path, "r").read()
    learned_hyp_file_2 = open(learned_hyp_file_2_path, "r").read()
    learned_hyp_file_3 = open(learned_hyp_file_3_path, "r").read()
    test_examples_file = open(test_examples_path, "r").read().split("% Background Knowledge")[0].split("% Examples")[1]


    # Extract examples using RegEX - Note. Binary classification only
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


    hyp_1_rules = build_rules(learned_hyp_file_1)
    hyp_2_rules = build_rules(learned_hyp_file_2)
    hyp_3_rules = build_rules(learned_hyp_file_3)


    positive_predictions = []
    negative_predictions = []
    for example in positive_examples:
        pred_1 = predict(example, hyp_1_rules)
        pred_2 = predict(example, hyp_2_rules)
        pred_3 = predict(example, hyp_3_rules)
        positive_predictions.append(policy_prediction(pred_1, pred_2, pred_3, test_examples_type))

    for example in negative_examples:
        pred_1 = predict(example, hyp_1_rules)
        pred_2 = predict(example, hyp_2_rules)
        pred_3 = predict(example, hyp_3_rules)
        negative_predictions.append(policy_prediction(pred_1, pred_2, pred_3, test_examples_type))
        
    # Calculate F1 Score
    tp = sum(positive_predictions)
    fn = len(positive_predictions) - tp
    fp = sum(negative_predictions)
    tn = len(negative_predictions) - fp

    if (tp + fp) != 0:
        precision = tp / (tp + fp)
    else:
        precision = 0
    if (tp + fn) != 0:
        recall = tp  / (tp + fn)
    else:
        recall = 0

    if (precision + recall) != 0:
        f1 = 2 * ((precision*recall) / (precision + recall))
    else:
        f1 = 0

    # Calculate Accuracy
    accuracy = (tp + tn) / (tp + tn + fp + fn)

    print('Number of Positive Examples: ', len(positive_examples))
    print('Number of Negative Examples: ', len(negative_examples))
    print('Precision: ', precision)
    print('Recall: ', recall)
    print('F1 Score: ', f1)
    print('Accuracy: ', accuracy)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Policy Based Ensembles FastLAS score')
    parser.add_argument('learned_hyp_file_1', help='The learned hypothesis file 1 to score against')
    parser.add_argument('learned_hyp_file_2', help='The learned hypothesis file 2 to score against')
    parser.add_argument('learned_hyp_file_3', help='The learned hypothesis file 3 to score against')

    parser.add_argument('test_examples', help='The .las file containing the test examples')
    parser.add_argument('test_examples_type', help='The type of the test examples (icmp, tcmp, udp).')
    parser.add_argument('--predictor_positive_value', 
        help='The value of the predictor for a positive class in binary classification (default: accept).',
        default='accept')
    
    args = parser.parse_args()
    main(args)

