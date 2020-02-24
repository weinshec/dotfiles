# vim stand-alone
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# system-wide
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
fi
if [ -f /usr/share/fzf/completion.zsh ]; then
  source /usr/share/fzf/completion.zsh
fi

# use fd as default if existent
if type fd > /dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# pacman search with preview
alias pacsearch="pacman -Slq | fzf -m --preview 'pacman -Si {1}'"
