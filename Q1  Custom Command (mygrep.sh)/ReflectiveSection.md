# mygrep.sh - Reflective Section

## 1. A breakdown of how your script handles arguments and options.

The script uses `getopts` to handle options like `-n` (show line numbers) and `-v` (invert match). After parsing options, the script processes the remaining arguments: the first being the search string and the second the file name.

## 2. If you were to support regex or -i/-c/-l options, how would your structure change?

To support `-i` (ignore case), `-c` (count matches), and `-l` (list filenames), I would add these options to the `opts` parsing section and handle them with the `grep` command. Regex support would remain as-is because `grep` natively supports regex.

## 3. What part of the script was hardest to implement and why?

The hardest part was argument validation, ensuring the script handles cases where the search string or file is missing or incorrectly specified.
