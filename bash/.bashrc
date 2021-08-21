#------------------------------------------------------------
# If not running interactively, don't do anything
#------------------------------------------------------------
[ -z "$PS1" ] && return

#------------------------------------------------------------
# source bashrc config files
#------------------------------------------------------------
source $HOME/.bashrc_config/aliases
source $HOME/.bashrc_config/functions
source $HOME/.bashrc_config/colors
source $HOME/.bashrc_config/variables


#------------------------------------------------------------
# START COMMANDS
#------------------------------------------------------------
echo -e "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\
- DISPLAY on ${BRed}$DISPLAY${NC}\n"
date




