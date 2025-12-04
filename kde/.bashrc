if command -v tmux >/dev/null 2>&1; then
  if [[ -z "$TMUX" && -z "$SSH_TTY" ]]; then
    tmux has-session -t default 2>/dev/null || tmux new-session -s default
    tmux attach-session -t default
  fi
fi

# Vim mode & reverse search
set -o vi

# Interactive shell only
[[ $- != *i* ]] && return

# History
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s checkwinsize

# Lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Prompt (USGC style)
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
PS1="\[$(tput setaf 7)\]❬\h❭ \[$(tput setaf 2)\]\W\[$(tput setaf 1)\] ●\[$(tput sgr0)\] "

# LS colors & common aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias ll='eza -lah --icons'
alias ls='eza'
alias d='cd ~/Developer'
alias gtm='cd ~/gtm'
alias dot='cd ~/Developer/dotfiles'
alias z='cd ~/Developer/zookeep'
alias nt='vim ~/Developer/notes.md'
alias n='nvim'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias cursor='~/Applications/cursor.AppImage --no-sandbox'

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Bash completion
if ! shopt -oq posix; then
  [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
  [ -f /etc/bash_completion ] && . /etc/bash_completion
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

FNM_PATH="$HOME/.local/share/fnm"
[ -d "$FNM_PATH" ] && export PATH="$FNM_PATH:$PATH" && eval "$(fnm env)"

export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in *":$PNPM_HOME:"*) ;; *) export PATH="$PNPM_HOME:$PATH" ;; esac

export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"

### Rancher Desktop
export PATH="$HOME/.rd/bin:$PATH"

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/fuadnafiz98/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
