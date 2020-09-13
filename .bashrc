# ~/.bashrc

#-----------------------------------------------------------------#
###############  What is the .bashrc ? ##########################
#-----------------------------------------------------------------#

#    This file is loaded when the user logs in.
#    It provides to set some caractristics for your terminal session.
#    You can enable completion, update shell history, command alliases,
#    and more.


#-----------------------------------------------------------------#
##############  Settings & enblings  #############################
#-----------------------------------------------------------------#

###### Set Editor by default
export EDITOR=nano

#    If not running interactively, don't do anything
[[ $- != *i* ]] && return

###### Alias command to perform the interaction of the terminal
alias ls='ls --color=auto'
if [ -f $HOME/.bashrc_aliases ]; then
    source  $HOME/.bashrc_aliases
fi

###### Logo in the starting of the terminal
if [ -d $HOME/.config/bashrc_exec/ ]; then
   for f in $HOME/.config/bashrc_exec/?*.sh ; do
     [ -x "$f" ] && "$f"
   done
   unset f
fi

###### Variable that is showed to the users input of the terminal 
#| original terminal line
#PS1='[\u@\h \W]\$ '
#| personel terminal line
PS1='\e[31m\u\e[0m| [\e[38;5;136mRepertory: \W\e[0m] |\e[38;5;136mCommand\e[0m: '
