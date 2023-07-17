# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=2000
SAVEHIST=1000
setopt autocd extendedglob notify
unsetopt beep

bindkey -v
# plugin order: zsh-autosuggestions, zsh-syntax-highlighting, zsh-vim-mode
#source "$HOME/projects/zsh-vim-mode/zsh-vim-mode.plugin.zsh" 
source "$HOME/projects/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

export PATH=$PATH:~/.local/bin:~/.local/share/flatpak/exports/bin:~/.config/lsp/lua-language-server/bin
export LESSHISTFILE=~/.config/less/history

# Base16 Shell
BASE16_SHELL="$HOME/projects/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

alias vim=nvim
alias ls='ls --color=tty'
alias reboot='systemctl reboot --firmware-setup'
alias nvim='nvim.appimage'
alias lazyvim='NVIM_APPNAME=LazyVim nvim'

# MPL: moves line when mode changes between normal and insert for zsh-vi-mode and zsh-vim-mode
# eval $(starship init zsh)
fpath+=$HOME/projects/pure
autoload promptinit; promptinit
# prompt spaceship
source ~/projects/spaceship-prompt/spaceship.zsh
# prompt pure

export EDITOR=nvim
export VISUAL=$EDITOR

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/mplilly/.config/zsh/.zshrc'

autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
# End of lines added by compinstall

alias luamake=/home/mplilly/.config/lsp/lua-language-server/3rd/luamake/luamake
