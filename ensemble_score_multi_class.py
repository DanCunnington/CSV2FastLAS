import re
import argparse
import ast
import numpy as np
import sys

# Take in three learned hypothesis files, test examples and calculate combination policy results

def build_rules(hyp):
    # Build rules
    rules = {}
    r_str = '((class(.+)) :- )([^\.]+)'
    matches = re.findall(r_str, hyp)
    for rule in matches:
        to_check = {}
        class_str = rule[1]
        features_and_values = rule[3].split(', ')
        for fv in features_and_values:
            feature = fv.split('(')[0]
            value = fv.split('(')[1].split(')')[0]
            to_check[feature] = value

        if class_str in rules:
            rules[class_str].append(to_check)
        else:
            rules[class_str] = [to_check]
    return rules


def predict(example, hyp_rules_for_class):
    rule_results = {}
 
    # Check class membership
    for c in hyp_rules_for_class:
        class_rules = hyp_rules_for_class[c]
        class_rule_results = []

        for r in class_rules:
            rule_fail = False
            for idx,k in enumerate(r):
                target = r[k]
                if example[k] != target:
                    rule_fail = True
            class_rule_results.append(not rule_fail)

        # If any results are true, this means the example belongs to this class
        in_class = any(class_rule_results)
        rule_results[c] = in_class
    
    # Class should be the only class in rule results that contains a 1
    # Check for multiple 1s - represents confusion and if so print warning and quit
    final_pred = [x for x in rule_results if rule_results[x] == 1]
    if len(final_pred) == 1:
        return final_pred[0]
    elif len(final_pred) == 0:
        # Default to benign if no prediction made
        print('Warning, no prediction made by site.')
        return None
    else:
        print('Warning - multiple final predictions')
        print(rule_results)
        print(final_pred)
        return None


def policy_prediction(pred_a, pred_b, pred_c, test_examples_type, classes):
    one_h_pred_a = {}
    one_h_pred_b = {}
    one_h_pred_c = {}
    for cl in classes:
        one_h_pred_a[cl] = 0
        one_h_pred_b[cl] = 0
        one_h_pred_c[cl] = 0

    if pred_a:
        one_h_pred_a[pred_a] = 1
    if pred_b:
        one_h_pred_b[pred_b] = 1
    if pred_c:
        one_h_pred_c[pred_c] = 1

    one_h_pred_a = np.array([one_h_pred_a[p] == 1 for p in one_h_pred_a])
    one_h_pred_b = np.array([one_h_pred_b[p] == 1 for p in one_h_pred_b])
    one_h_pred_c = np.array([one_h_pred_c[p] == 1 for p in one_h_pred_c])

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

    policy_preds = (frac_a*one_h_pred_a + frac_b*one_h_pred_b + frac_c*one_h_pred_c) / (frac_a + frac_b + frac_c)
    if any(policy_preds):
        return classes[np.argmax(policy_preds)]
    else:
        print('No prediction made by any model')
        return None

def main(args):
    learned_hyp_file_1_path = args.learned_hyp_file_1
    learned_hyp_file_2_path = args.learned_hyp_file_2
    learned_hyp_file_3_path = args.learned_hyp_file_3
    test_examples_path = args.test_examples
    test_examples_type = args.test_examples_type
    classes = ast.literal_eval(args.classes)


    learned_hyp_file_1 = open(learned_hyp_file_1_path, "r").read()
    learned_hyp_file_2 = open(learned_hyp_file_2_path, "r").read()
    learned_hyp_file_3 = open(learned_hyp_file_3_path, "r").read()
    test_examples_file = open(test_examples_path, "r").read().split("% Background Knowledge")[0].split("% Examples")[1]


    # Extract examples using RegEX - Note. Binary classification only
    r_str = '(#pos\(.*, {)(((\s*)+[^\)|\}]+\)\.)+)'
    matches = re.findall(r_str, test_examples_file)

    examples = {}
    for m in matches:
        class_str = m[0].split(',')[1].split('{ ')[1].split(' }')[0]
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

        if class_str in examples:
            examples[class_str].append(example)
        else:
            examples[class_str] = [example]

    hyp_1_rules = build_rules(learned_hyp_file_1)
    hyp_2_rules = build_rules(learned_hyp_file_2)
    hyp_3_rules = build_rules(learned_hyp_file_3)

    class_predictions = {}
    none_class_predictions = {}
    n_correct = 0
    n_total = 0
    n_pred_for = 0
    n_skipped = 0
    for class_str_gt in examples:
        class_predictions[class_str_gt] = []
        none_class_predictions[class_str_gt] = 0
        for ex in examples[class_str_gt]:
            pred_1 = predict(ex, hyp_1_rules)
            pred_2 = predict(ex, hyp_2_rules)
            pred_3 = predict(ex, hyp_3_rules)
            policy_pred = policy_prediction(pred_1, pred_2, pred_3, test_examples_type, classes)
            if policy_pred:
                class_predictions[class_str_gt].append(policy_pred)
            else:
                none_class_predictions[class_str_gt] += 1


        # Score each class
        n_gt = len(examples[class_str_gt])
        n_pred = len(class_predictions[class_str_gt])
        n_predict = len([p for p in class_predictions[class_str_gt] if p == class_str_gt])
        n_total += n_gt
        n_correct += n_predict
        n_pred_for += n_pred
        n_skipped += none_class_predictions[class_str_gt]

    print('Final results')
    print('Number of Test Examples: ', n_total)
    print('Number of None predictions: ', n_skipped)
    print('Number of Examples made a prediction for: ', n_pred_for)
    print('Accuracy: ', n_correct / n_pred_for)  

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Policy Based Ensembles FastLAS score')
    parser.add_argument('learned_hyp_file_1', help='The learned hypothesis file 1 to score against')
    parser.add_argument('learned_hyp_file_2', help='The learned hypothesis file 2 to score against')
    parser.add_argument('learned_hyp_file_3', help='The learned hypothesis file 3 to score against')

    parser.add_argument('test_examples', help='The .las file containing the test examples')
    parser.add_argument('test_examples_type', help='The type of the test examples (icmp, tcp, udp).')
    parser.add_argument('--classes', help='The list of classes to use. Default: "[\'class(benign)\',\'class(dos)\',\'class(probe)\',\'class(u2r)\',\'class(r2l)\']"', 
        default="['class(benign)','class(dos)','class(probe)','class(u2r)','class(r2l)']")
    
    args = parser.parse_args()
    main(args)

