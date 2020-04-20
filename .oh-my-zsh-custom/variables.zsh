export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -f /usr/bin/nvim ]; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

export BROWSER=chromium

export PANEL_FIFO="/tmp/panel-fifo"
