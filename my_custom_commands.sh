#!/usr/bin/env bash

# In `~/.bashrc` or `~/.zshrc`:
# source my_custom_commands.sh

<< END_OF_FUNCTION
ni() {
  for param do
    dir="$(dirname -- "$param")"
    mkdir -p -- "$dir" &&
      touch -- "$param"
  done
}
END_OF_FUNCTION
# ni /path/file_a /path/file_b
# from: https://unix.stackexchange.com/questions/168580/make-parent-directories-while-creating-a-new-file
# Note: `for param do` is short form of `for param in "$@"; do`

ni() {
  for param do
    dir="${param%/*}"
    file="${param##*/}"
    mkdir -p -- "$dir" &&
    if [ -n "$file" ]; then touch -- "$param"; fi
  done
}
# ni /path/dir/ /path/dir_b/file
# will create directory (endswith '/') or files with intermediate directories
