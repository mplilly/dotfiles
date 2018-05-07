#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
alias ls='ls -G'
# PS1='[\u@\h \W]\$ '

# liquidprompt (for interactive shells)
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

alias vim='nvim'

set -o vi
export VISUAL=vim
export EDITOR=$VISUAL

# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
