# Ananya's ZSH config

# Save history to cache directory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/.zsh_history

# Enable colors and change prompt

autoload -Uz vcs_info
autoload -U colors && colors


# Customizing the prompt

# Default
# %n@%m %1~ %#

# enable only git 
zstyle ':vcs_info:*' enable git 

# setup a hook that runs before every ptompt. 
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:*' formats ' %F{red}%s(%F{blue}%b%f%F{red})%f'

# format our main prompt for hostname current folder, and permissions.
# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[red]%}@%{$fg[white]%}%m%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%B%{$fg[blue]%}[%{$fg[white]%}%n%{$fg[blue]%}] %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
# PROMPT="%{$fg[green]%}%n@%m %~ %{$reset_color%}%#> "
PROMPT+="\$vcs_info_msg_0_ "


# Basic auto/tab complete

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)


# Vim Mode

bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# zsh syntax highlighting 

source $HOME/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/aliasdoc

# add to .zshenv if highlighters directory not found
#
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOME/homebrew/share/zsh-syntax-highlighting/highlighters
