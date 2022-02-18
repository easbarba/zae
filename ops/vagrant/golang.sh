#!/usr/bin/env bash

BIN="$HOME/bin"

# Grab gimme
if test ! -f "$BIN/gimme"; then
  mkdir -p "$BIN"
  curl -sL -o "$BIN/gimme" https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
  chmod +x "$BIN/gimme"
fi

# install go
"$BIN/gimme" 1.17

# source gimme
echo ". $HOME/.gimme/envs/go1.17.linux.amd64.env" >>"$HOME/.bashrc"
