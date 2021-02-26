#!/usr/bin/env bash

# In `~/.bashrc` or `~/.zshrc`:
# source my_custom_commands.sh

ni() {
  for param do
    dir="$(dirname -- "$param")"
    mkdir -p -- "$dir" &&
      touch -- "$param"
  done
}
# ni /path/file_a /path/file_b
# from: https://unix.stackexchange.com/questions/168580/make-parent-directories-while-creating-a-new-file
# Note: `for param do` is short form of `for param in "$@"; do`
