#!/usr/bin/env python
"""
Code Owners formatter.
- ignore lines starting with # or [
- ignore blank lines
- format the rest of the lines like `column -t` would

file: ~/.vim/scripts/scripts/fmt-codeowners.py
"""

import sys

# import vim

buffer: list[str] = []
new_buffer: list[str] = []

max_size: dict[int, int] = {}

line: str
token: str
index_token: int
index_names: int
tokens: list[str]

for line in (line.rstrip("\r\n") for line in sys.stdin):
    buffer.append(line)

for line in buffer:
    if line.startswith("#") or line.startswith("[") or len(line) == 0:
        continue

    index_token = 0
    for token in line.split():
        max_size[index_token] = max(len(token), max_size.get(index_token, 0))
        index_token += 1

for line in buffer[:]:
    if line.startswith("#") or line.startswith("[") or len(line) == 0:
        new_buffer.append(line)
        continue

    index_token = 0
    tokens = line.split()
    for token in tokens:
        max_size[index_token] = max(len(token), max_size.get(index_token, 0))
        index_token += 1

    new_line: str = tokens[0].ljust(max_size.get(0, 0) + 8, " ")

    index_names = 1  # starting on the 2nd token
    for token in line.split()[1:]:
        new_line += token.ljust(max_size[index_names] + 1, " ")
        index_names += 1

    new_buffer.append(new_line)

for line in new_buffer:
    print(line)
