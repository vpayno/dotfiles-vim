"""
~/.vim/scripts/format_json.py

https://github.com/elzr/vim-json
https://vi.stackexchange.com/questions/16906/how-to-format-json-file-in-vim
"""

import json

import vim

try:
    buf = vim.current.buffer
    JSON_CONTENT = "\n".join(buf[:])
    content = json.loads(JSON_CONTENT)
    sorted_content = json.dumps(content, indent=4, sort_keys=True)
    buf[:] = sorted_content.split("\n")
except Exception as err:
    print(f"Unexpected {err=}, {type(err)=}")
