# .zshrc
# Author : Sagar Mohan <sagarmohan846@gmail.com>
# License : unlicense

# To "freeze/unfreeze" the terminal. Many programs change the terminal state, and often do not restore
# terminal settings on exiting abnormally. To avoid the need to manually reset the terminal :
ttyctl -f

# Add the zsh syntax highlighting addon
# install via pacman zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Aliases
alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
alias remove='sudo pacman -Rns'
alias dremove='sudo pacman -Runs'
alias search='sudo pacman -Q'
alias aur='yaourt'
alias auru='yaourt -Syu --aur'
alias :q='exit'
alias progs='cd Programs'
alias rs='rustc'
alias l='ls'
alias ll='ls -l'
alias la='ls -al'
alias szsh='source ~/.zshrc'
alias home='cd ~'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=25000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sagar/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

#Use the redhat theme
#prompt redhat

# The Zsh help command
autoload -Uz run-help
#unalias run-help
alias help=run-help

# More Help stuff
autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# Command Auto-correction
setopt correctall

# The autocd option can be set to avoid tedious typing of cd command
# while changing current directory (for example /etc instead of cd /etc)
setopt autocd

# If standard bash-like globbing does not satisfy, extendedglob option may be set to enable extended globbing
setopt extendedglob

# To have these new exectuables included in auto-completion
zstyle ':completion:*' rehash true

# Dynamic title in terminal window
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn '\e]2;%n@%m %1~\a'
}

function xterm_title_preexec () {
	print -Pn '\e]2;%n@%m %1~ %# '
	print -n "${(q)1}\a"
}

if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi
