#!/usr/bin/env python3

import sys
from collections import defaultdict
import os


def main():
    output_files = defaultdict(list)

    output_dir = sys.argv[2]

    os.mkdir(output_dir)

    with open(sys.argv[1]) as file:
        for line in file:
            line_length = len(line.strip())
            output_files[line_length].append(line)

    # Write lines to separate files based on their length
    for length, lines in output_files.items():
        with open(os.path.join(output_dir, f"lines_length_{length}.txt"), "w") as handle:
            handle.writelines(lines)


if __name__ == "__main__":
    main()
