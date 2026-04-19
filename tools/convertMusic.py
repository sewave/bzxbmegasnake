import argparse

def parse_input_file(input_file):
    with open(input_file, 'r') as file:
        lines = file.readlines()

    music_data = []
    pattern_data = []
    patterns = {}
    current_pattern = None
    current_values = []
    in_pattern_data_section = False

    for line in lines:
        line = line.strip()

        if line.startswith("ORG"):
            continue  # Ignorar la línea de ORG

        elif line.startswith("MUSICDATA:"):
            continue  # Ignorar la etiqueta MUSICDATA

        elif line.startswith("DEFB") and len(music_data) < 2:
            # Extraer valores para MUSICDATA sin convertirlos
            value = line.split()[1].replace(';', '').strip()
            music_data.append(value)

        elif line.startswith("PATTERNDATA:"):
            pattern_name = line.split()[2].strip()
            pattern_data.append(pattern_name)
            in_pattern_data_section = True
        elif in_pattern_data_section and line.startswith("DEFW"):
            # Conservar el formato DEFW PAT0
            pattern_name = line.split()[1].strip()
            pattern_data.append(pattern_name)

        elif line.startswith("PAT"):
            if current_pattern:
                patterns[current_pattern] = current_values
                current_values = []

            current_pattern = line.split(':')[0].strip()

        elif line.startswith("DEFB"):
            current_values.append(line.split()[1].replace('$', ''))

    if current_pattern:
        patterns[current_pattern] = current_values

    return music_data, pattern_data, patterns

def convert_to_new_format(name, music_data, pattern_data, patterns):
    output_lines = []

    # Convert MUSICDATA
    pattern_data_address = f"(@{name}_patternData + 8)"
    music_data.append(f"CAST(UBYTE, {pattern_data_address})")
    music_data.append(f"CAST(UBYTE, {pattern_data_address} / 256)")
    music_data_str = ', '.join(music_data)
    output_lines.append(f"DIM {name}_musicData({len(music_data) - 1}) AS UBYTE => {{{music_data_str}}}")

    # Convert PATTERNDATA
    pattern_data_str = ', '.join(f"(@{name}_{pat.lower()} + 8)" for pat in pattern_data)
    output_lines.append(f"DIM {name}_patternData({len(pattern_data) - 1}) AS UINTEGER => {{{pattern_data_str}}}")

    # Convert individual patterns
    for pattern_name, values in patterns.items():
        effect_name = f"{name}_{pattern_name.lower()}"
        array_size = (len(values) - 1) * 2 - 1  # Restar 1 al tamaño
        formatted_values = ', '.join(values)
        output_lines.append(f"DIM {effect_name}({array_size}) AS UBYTE => {{{formatted_values}}}")

    return output_lines

def write_output_file(output_file, output_lines):
    with open(output_file, 'w') as file:
        for line in output_lines:
            file.write(line + '\n')

def main():
    parser = argparse.ArgumentParser(description='Convert pattern data from one format to another.')
    parser.add_argument('input_file', help='Path to the input file')
    parser.add_argument('output_file', help='Path to the output file')
    parser.add_argument('name', help='Prefix for all generated variable names')

    args = parser.parse_args()

    music_data, pattern_data, patterns = parse_input_file(args.input_file)
    output_lines = convert_to_new_format(args.name, music_data, pattern_data, patterns)
    write_output_file(args.output_file, output_lines)

if __name__ == "__main__":
    main()
