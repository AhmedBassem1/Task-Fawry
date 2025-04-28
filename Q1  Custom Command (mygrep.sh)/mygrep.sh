#!/bin/bash

# show usage info
usage() {
    echo "Usage: $0 [OPTIONS] SEARCH_STRING FILE"
    echo "Options:"
    echo "  -n    Show line numbers"
    echo "  -v    Invert match"
    echo "  --help Show help"
    exit 1
}

show_line=false
invert=false

# check for --help
for arg in "$@"; do
    [ "$arg" = "--help" ] && usage
done

# parse options
while getopts ":nv" opt; do
    case $opt in
        n) show_line=true ;;
        v) invert=true ;;
        *) usage ;;
    esac
done
shift $((OPTIND - 1))

# validate arguments
[ $# -lt 2 ] && { echo "Error: Missing search string or file."; usage; }

search="$1"
file="$2"

# check file exists
[ ! -f "$file" ] && { echo "Error: File '$file' not found."; exit 1; }

# build grep options
opts="-i"
$show_line && opts="${opts}n"
$invert && opts="${opts}v"

# run grep
grep $opts "$search" "$file"
