# ~/.bashrc: executed by bash for non-login shells

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source shell-agnostic configurations
for file in ~/.shell/{path,exports,aliases,functions}.sh; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Bash-specific settings
# -----------------------

# Don't put duplicate lines in the history
export HISTCONTROL=ignoredups:erasedups

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command
shopt -s checkwinsize

# Make less more friendly for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Source local configuration if it exists
if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
