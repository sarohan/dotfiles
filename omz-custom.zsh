# Aliases
alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
alias remove='sudo pacman -Rns'
alias dremove='sudo pacman -Runs'
alias search='sudo pacman -Q'
alias aur='yay'
alias auru='yay -Syu --aur'
alias :q='exit'
alias progs='cd Programs'
alias rs='rustc'
alias l='ls'
alias ll='ls -l'
alias la='ls -al'
alias szsh='source ~/.zshrc'
alias home='cd ~'
alias py2='python2'
alias py3='python3'
alias vim='nvim'
alias arm-gcc='arm-none-eabi-gcc'
alias arm-g++='arm-none-eabi-g++'
alias arm-gdb='arm-none-eabi-gdb'
alias arm-objdump='arm-none-eabi-objdump'
alias ls="eza"
alias ghidra="~/tools/ghidra/ghidraRun"
alias godot="~/tools/Godot"

# mkdir and cd into the directory using "mkcd DIR_NAME"
mkcd ()
{
  mkdir -p -- "$1" &&
  cd -P -- "$1"
}
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

## workaround for handling TERM variable in multiple tmux sessions properly (by Nicholas Marriott)
if [[ -n ${TMUX} && -n ${commands[tmux]} ]];then
        case $(tmux showenv TERM 2>/dev/null) in
                *256color) ;&
                TERM=fbterm)
                        TERM=screen-256color ;;
                *)
                        TERM=screen
        esac
fi

