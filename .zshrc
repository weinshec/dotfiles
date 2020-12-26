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
export BROWSER=firefox
export WORKSPACE=$HOME/workspace
export LM_LICENSE_FILE=$HOME/.licenses/zwrsLicense.lic
export PANEL_FIFO="/tmp/panel-fifo"
export TIMELOG=$HOME/.esrlabs.timeclock
export MANPAGER='nvim +Man!'

if [ -f /usr/bin/nvim ]; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

#
# ALIASES
#
if ! type exa > /dev/null; then
  alias ll='ls -lhH --group-directories-first'
  alias la='ls -lAhH --group-directories-first'
else
  alias ll='exa -l --group-directories-first'
  alias la='exa -la --group-directories-first'
  alias tree='exa --tree -l'
fi

alias cds='cd ~/scratch'
alias cdw='cd ~/workspace'
alias cat='bat'
alias vim='nvim'

alias ttoday='ledger -f $TIMELOG balance --period "today"'
alias tweek='ledger -f $TIMELOG balance --period "this week"'
alias tedit='vim $TIMELOG +'

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
# PROJECT ENV
#
penv() {
    if [ $# -eq 0 ]; then
      PROJECT=`basename ${PWD}`
    elif [ $# -eq 1 ]; then
      PROJECT=$1
    else
      echo "Syntax:  penv [name]"
      return -1
    fi

    if [ ! -d ${WORKSPACE}/projects/$PROJECT ]; then
      echo "Not a project: $PROJECT"
      return -1
    fi

    export PENV_PROJECT=$PROJECT
    export PENV_PROJECT_ROOT=$WORKSPACE/projects/$PROJECT

    alias cdw='cd $PENV_PROJECT_ROOT'

    source $HOME/.rvm/scripts/rvm
    rvm use 2.5.1

    if [ -f ${PENV_PROJECT_ROOT}/setEnv.sh ]; then
      source ${PENV_PROJECT_ROOT}/setEnv.sh
    fi
}


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

#
# STARSHIP prompt
#
eval "$(starship init zsh)"
