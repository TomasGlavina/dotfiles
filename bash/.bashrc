# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

# Function to get current git branch
parse_git_branch() {
  git branch --show-current 2>/dev/null
}

# Colors (Gruvbox-ish, but subtle)
BLUE="\[\e[34m\]"
GREEN="\[\e[32m\]"
YELLOW="\[\e[33m\]"
RESET="\[\e[0m\]"

# Two-line PS1
export PS1="\n${BLUE}\w${RESET} \$(branch=\$(parse_git_branch); \
if [ -n \"\$branch\" ]; then echo \"${YELLOW}(\$branch)${RESET}\"; fi)\n\$ "

unset rc
export HISTSIZE=100000
export HISTCONTROL=ignoredups
alias ls="eza --group-directories-first"
alias ll="eza -lh --icons --group-directories-first"
alias la="eza -lha --icons --group-directories-first"
alias lt="eza --tree --icons --group-directories-first"
alias config="cd ~/.config && nvim ."
alias work="cd ~/Work/Gaddr/backend/gaddr-backend-api/"
alias update="sudo dnf update"
alias code="code --password-store="gnome-libsecret""

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
