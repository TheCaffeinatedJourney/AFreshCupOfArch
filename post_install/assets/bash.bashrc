# /etc/bash.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# default prompt
PS1='[\u@\h \W]\$ '

# set window title
case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

# source bash-completion
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

# Configure line breaks on invocation of man
man() {
        local width=$(tput cols)
        [ $width -gt $MANWIDTH ] && width=$MANWIDTH
        env MANWIDTH=$width man "$@"
}

#######################################
### history settings
#######################################

# add date time to history
HISTTIMEFORMAT="%F %T "

# don't put duplicate lines or lines starting with space in the history.
# remove duplicates from history file
# See bash(1) for more options
HISTCONTROL=ignoredups:erasedups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

#######################################
### shell options
### see https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
### also "shopt | column"
#######################################

# type the name of a directory to automatically cd into it
shopt -s autocd

# fix minor errors in spelling when using cd
shopt -s cdspell

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# save multiple-line commands into one history entry
shopt -s cmdhist

# fix minor errors on direcotry names during word completion
shopt -s dirspell

# expand_aliases
shopt -s expand_aliases

# enable extended pattern matching
shopt -s extglob

# perform single and double quoting within expansions enclosed in double quotes
shopt -s extquote

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# append to the history file, don't overwrite it
shopt -s histappend

# match filenames in case-insensitive mode when performing filename expansion
shopt -s nocaseglob

# allow echo to expand backslash excape sequences
shopt -s xpg_echo

#######################################
### other settings
#######################################

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prevent ranger from loading the global configuration file in addition to the local
export RANGER_LOAD_DEFAULT_RC=false

# force alacritty to correctly scale between external monitors and laptop display
export WINIT_X11_SCALE_FACTOR=1

#######################################
### colors 
#######################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

