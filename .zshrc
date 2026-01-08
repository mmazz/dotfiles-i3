### Colors & Prompt
autoload -U colors && colors
PS1="%B%{$fg[cyan]%}[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[cyan]%}%M %{$fg[white]%}%~%{$fg[cyan]%}]%{%}$%b "
### Shell options
stty stop undef # saca el Ctrl+s para freezar terminal

### Environment
export TERM="xterm-256color"
export _JAVA_AWT_WM_NONREPARENTING=1
export LS_COLORS="di=1;34:fi=0;37:ow=1;34:tw=1;34"
export LESS='-R' # colores para less
export MYVIMRC="$HOME/.config/nvim/init.lua"

### History (sane size)
HISTSIZE=200000
SAVEHIST=200000
HISTDIR="$HOME/.cache/zsh"
HISTFILE="$HISTDIR/history"
[[ -d $HISTDIR ]] || mkdir -p "$HISTDIR"
setopt appendhistory inc_append_history share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

### Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$HISTDIR/zcompdump"
_comp_options+=(globdots)

### Vi mode
bindkey -v
export KEYTIMEOUT=1

# Modo NORMAL (vicmd)
bindkey -M vicmd 'h' backward-char
bindkey -M vicmd 'j' down-line-or-history
bindkey -M vicmd 'k' up-line-or-history
bindkey -M vicmd 'l' forward-char
bindkey -M vicmd 'v' visual-mode

# Vim keys in completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Bindings para flechas arriba/abajo (cubre ambos modos de teclado)
bindkey -M viins '^[[A' history-beginning-search-backward-end
bindkey -M viins '^[OA' history-beginning-search-backward-end
bindkey -M viins '^[[B' history-beginning-search-forward-end
bindkey -M viins '^[OB' history-beginning-search-forward-end

# Opcional: también en modo command (vicmd) para que funcione si estás en normal mode
bindkey -M vicmd '^[[A' history-beginning-search-backward-end
bindkey -M vicmd '^[OA' history-beginning-search-backward-end
bindkey -M vicmd '^[[B' history-beginning-search-forward-end
bindkey -M vicmd '^[OB' history-beginning-search-forward-end

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M viins '^?' backward-delete-char
### Cursor shape (minimal)
function zle-keymap-select {
  [[ $KEYMAP == vicmd ]] && echo -ne '\e[1 q' || echo -ne '\e[5 q'
}
zle -N zle-keymap-select
echo -ne '\e[5 q'

### Edit command line in vim
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

### Aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zsh/aliasrc"
#alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

### Syntax highlighting (last)
## sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles-i3/ --work-tree=$HOME'
alias vim='nvim'

alias zathura='zathura --fork'
alias ls='ls --color=auto'

export PATH="$HOME/bin:$PATH"
