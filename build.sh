#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <cv-file.md>"
  exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
  echo "Error: File '$input_file' not found"
  exit 1
fi

output_file="${input_file%.md}.pdf"

pandoc "$input_file" \
  --template=template.tex \
  --pdf-engine=xelatex \
  -o "$output_file"

echo "Generated: $output_file"
