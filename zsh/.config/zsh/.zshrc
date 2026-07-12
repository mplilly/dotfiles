# ~/.config/zsh/.zshrc

# ---- History ----
HISTFILE="$HOME/.local/state/zsh/history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY         # live-share history across open shells
setopt EXTENDED_HISTORY      # record timestamps
setopt HIST_IGNORE_ALL_DUPS  # drop older duplicate when a command repeats
setopt HIST_IGNORE_SPACE     # skip commands typed with a leading space
setopt HIST_REDUCE_BLANKS    # tidy whitespace before saving
setopt HIST_VERIFY           # expand !! onto the line instead of running blind

# ---- Completion ----
autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'  # case-insensitive
zstyle ':completion:*' menu select                       # arrow-key menu

# ---- Editor ----
export EDITOR=nvim
export VISUAL=nvim

# -----= Path -----
typeset -U path
[[ -d $HOME/.local/bin ]] && path=($HOME/.local/bin $path)

# ---- Plugins (order matters) ----
ZPLUG="$ZDOTDIR/plugins"
source "$ZPLUG/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZPLUG/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZPLUG/zsh-history-substring-search/zsh-history-substring-search.zsh"

# ============ fzf ============
source <(fzf --zsh)   # Ctrl-R history · Ctrl-T files · Alt-C cd into subdir

export FZF_DEFAULT_OPTS=" \
--color=bg+:#292e42,bg:#1a1b26,spinner:#bb9af7,hl:#7aa2f7 \
--color=fg:#c0caf5,header:#9ece6a,info:#7aa2f7,pointer:#7dcfff \
--color=marker:#9ece6a,fg+:#c0caf5,prompt:#7dcfff,hl+:#7dcfff \
--color=border:#3b4261,selected-bg:#283457"

# ============ vi mode ============
bindkey -v
export KEYTIMEOUT=1

# Esc then v -> edit the current command line in nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# keep a few familiar keys in insert mode
bindkey -M viins '^A' beginning-of-line
# bindkey -M viins '^E' end-of-line
bindkey -M viins '^W' backward-kill-word
bindkey -M viins '^?' backward-delete-char

# command recall: arrows in insert mode, k/j in normal mode
bindkey -M viins '^Y' autosuggest-accept
bindkey -M viins '^E' autosuggest-clear
bindkey -M viins '^X^O' autosuggest-fetch
bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
bindkey -M viins '^[[A' history-substring-search-up
bindkey -M viins '^[[B' history-substring-search-down
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# ============ prompt ============
eval "$(starship init zsh)"

# block cursor in normal mode, beam in insert + refresh the vi indicator
function zle-keymap-select {
  case $KEYMAP in
    vicmd)      echo -ne '\e[1 q';;
    viins|main) echo -ne '\e[5 q';;
  esac
  zle reset-prompt
}
zle -N zle-keymap-select
function zle-line-init { echo -ne '\e[5 q' }
zle -N zle-line-init
echo -ne '\e[5 q'

# ---- eza (modern ls with icons) ----
alias ls='eza --icons=auto --group-directories-first'
alias ll='eza -lh --icons=auto --group-directories-first --git'
alias la='eza -lha --icons=auto --group-directories-first --git'
alias lt='eza --tree --level=2 --icons=auto'

# ---- bat (cat with syntax highlighting) ----
alias cat='bat --paging=never'

# ---- git ----
alias g='git'
alias gst='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate --all'
alias gp='git push'
alias gpl='git pull'
alias gf='git fetch'

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always --icons=auto {}'"
export LESS='-R --quit-if-one-screen --mouse'
