# INFO: STOCK
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# INFO: MINE

# Prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
else
	color_prompt=
fi

if [ "$color_prompt" = yes ]; then
    # See Arch Wiki on Bash Prompt Customization for more
    PS1='\[\e[01;96m\]\u\[\e[01;92m\]@\h \[\e[01;93m\]\w\[\e[01;90m\] \$\[\e[00m\] '
    PS2='\[\e[01;92m\]>\[\e[00m\] '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt

alias nvimconfig="nvim ~/.config/nvim"

# WARN: LEAVE THESE LAST

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Initialize Zoxide
eval "$(zoxide init bash)"

# thefuck
eval "$(thefuck --alias)"

# If not already in Tmux, reconnect to previous session if available
# else start new session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# PIPX
# Created by `pipx` on 2025-11-24 22:27:48
export PATH="$PATH:/home/selfwareengineer/.local/bin"
eval "$(register-python-argcomplete pipx)"
