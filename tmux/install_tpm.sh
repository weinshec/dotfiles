#!/bin/sh

TPM_PATH=~/.tmux/plugins/tpm

if [ -f ${TPM_PATH}/tpm ]; then
  >&2 echo "TPM already installed!  --> Use <prefix> + I to install plugins"
  exit 0
fi

rm -rf $TPM_PATH
mkdir -p ~/.tmux/plugins
git clone -q https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

>&2 echo "TPM installed successfully!  --> Use <prefix> + I to install plugins"

