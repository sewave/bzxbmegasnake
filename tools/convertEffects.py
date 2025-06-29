import argparse
import re

def parse_input_file(input_file):
    with open(input_file, 'r') as file:
        lines = file.readlines()

    patterns = {}
    current_pattern = None
    current_values = []

    pattern_regex = re.compile(r'^PAT\d+')

    for line in lines:
        line = line.strip()

        if pattern_regex.match(line):
            if current_pattern:
                patterns[current_pattern] = current_values
                current_values = []

            current_pattern = line.split(':')[0].strip()

        elif line.startswith("DEFB") and current_pattern:
            current_values.append(line.split()[1].replace('$', '').split(sep = ',')[0])

    if current_pattern:
        patterns[current_pattern] = current_values

    return patterns

def convert_to_new_format(patterns):
    output_lines = []
    pattern_index = 1

    for pattern_name, values in patterns.items():
        effect_name = f"effect{pattern_index}"
        array_size = len(values) - 1  # Utilizar el tamaño correcto
        formatted_values = ', '.join(values)
        output_lines.append(f"DIM {effect_name}({array_size}) AS UBYTE => {{{formatted_values}}}")
        pattern_index += 1

    return output_lines

def write_output_file(output_file, output_lines):
    with open(output_file, 'w') as file:
        for line in output_lines:
            file.write(line + '\n')

def main():
    parser = argparse.ArgumentParser(description='Transform pattern data from one format to another.')
    parser.add_argument('input_file', help='Path to the input file')
    parser.add_argument('output_file', help='Path to the output file')

    args = parser.parse_args()

    patterns = parse_input_file(args.input_file)
    output_lines = convert_to_new_format(patterns)
    write_output_file(args.output_file, output_lines)

if __name__ == "__main__":
    main()
