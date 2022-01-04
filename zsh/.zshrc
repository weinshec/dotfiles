#
# GREETINGS
#
echo ""
echo "                    ______"
echo "                 _-' .   .\`-_"
echo "             |/ /  .. . '   .\ \|"
echo "            |/ /         .  ..\ \|"
echo "          \|/ |: .   ._|_ .: . | \|/"
echo "           \/ |   _|_. |.. .:  | \/"
echo "           \||| . .| .: _|_   .|||/"
echo "          \__| \ :. :.  .|.  ./ |__/"
echo "            __| \_  .    .. _/ |__"
echo "             __|  \`-______-'  |__"
echo "                -,____  ____,-"
echo "                  ---'  '---"
echo ""
echo "         UNITED FEDERATION OF PLANETS"
echo ""
echo ""


#
# ENVIRONMENT VARIABLES
#
export PATH=$HOME/bin:/usr/local/bin:$PATH
export BROWSER=librewolf
export WORKSPACE=$HOME/workspace
export PANEL_FIFO="/tmp/panel-fifo"

if [ -f /usr/bin/nvim ]; then
    export EDITOR=nvim
    export MANPAGER='nvim +Man!'
    alias vim='nvim'
else
    export EDITOR=vim
fi

if type bat > /dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  alias cat='bat'
fi


#
# ALIASES
#
if ! type exa > /dev/null; then
  alias ll='ls -lhH --group-directories-first'
  alias la='ls -lAhH --group-directories-first'
  test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)
else
  alias ll='exa -l --group-directories-first'
  alias la='exa -la --group-directories-first'
  alias tree='exa --tree -l'
fi

alias cds='cd ~/scratch'
alias cdw='cd ~/workspace'
alias cdp='cd ~/workspace/projects'
alias ip='ip -c'


#
# SSH-AGENT
#
if [ $(pgrep -u $USER ssh-agent | wc -l) -eq 0 ]; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! $SSH_AUTH_SOCK ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi


#
# FZF CONFIG
#
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


#
# RUST
#
if [ -e $HOME/.cargo/env ]; then
  source $HOME/.cargo/env
fi


#
# TASKWARRIOR LIST
#
taskl () {
  task projects | awk '
    {
      if(($0 != "") &&
         (substr($0,0,2) != "  ") &&
         ($1 != "Project") &&
         (substr($1,0,1) != "-") &&
         ($2 != "projects"))
      {
        system("task list project:"$1);
      }
    }'
}


#
# NNN
#
export GUI=1
export NNN_BMS='w:~/workspace;s:~/scratch;m:/media'
export NNN_OPENER=~/.config/nnn/plugins/nuke
export NNN_PLUG='t:preview-tui;v:imgviu'
export TERMINAL='alacritty'
export SPLIT="v"
alias n='nnn -c -a -d'


#
# ZSH OPTIONS
#
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' special-dirs true
setopt COMPLETE_ALIASES
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

bindkey jk vi-cmd-mode

#
# STARSHIP prompt
#
eval "$(starship init zsh)"
