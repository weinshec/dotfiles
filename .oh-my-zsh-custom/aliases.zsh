if ! type exa > /dev/null; then
  alias ll='ls -lhH --group-directories-first'
  alias la='ls -lAhH --group-directories-first'
else
  alias ll='exa -l --group-directories-first --git'
  alias la='exa -la --group-directories-first --git'
  alias tree='exa --tree -l --git'
fi

alias cds='cd ~/scratch'
alias cdw='cd ~/workspace'
alias cat='bat'
alias vim='nvim'
