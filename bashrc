#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# liquidprompt (for interactive shells)
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

alias mirrorlist="wget http://archlinux.org/mirrorlist/?country=US -O mirrorlist.backup"
alias mirror_uncomment="sed -i 's/^#Server/Server/' mirrorlist.backup"
alias mirror_speed="rankmirrors -n 6 mirrorlist.backup > mirrorlist"

alias vim='nvim'

set -o vi
export VISUAL=vim
export EDITOR=$VISUAL

export PATH=$PATH:~/.gem/ruby/2.5.0/bin

# add this configuration to ~/.bashrc
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
