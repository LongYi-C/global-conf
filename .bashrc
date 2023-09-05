# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# test longyi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
function settitle(){
  # 窗口名-win/wsl/lin@设备名：工作目录最后一个文件夹名
  echo -ne "\033]0$(hostname):$(whoami):$(pwd)\007"
  # 命令行名称
  PS1="\[\033[1;36m\]\h@\u\[\033[1;32m\][\w\[\033[1;36m\]$(parse_git_branch)\[\033[1;32m\]]\n\[\033[1;33m\]->\[\033[0m\]"
}
get_os() {
  # 判断win-wsl-lin-mac
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -d "/mnt" ]]; then
      echo "wsl" | sed -n 'p'
    else
      echo "lin" | sed -n 'p'
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "mac" | sed -n 'p'
  elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "win" | sed -n 'p'
  else
    echo "unknown" | sed -n 'p'
  fi
}
fig() {
  local hostname=$(hostname)
  if [[ $hostname == "y7000" ]]; then
    local os=$(get_os)
    if [[ $os == "wsl" ]]; then
      # 在WSL上
      echo "/mnt/d/longyi/all_resources/golbal-config" | sed -n 'p'
    else
      # 在Windows上
      echo "" | sed -n 'p'
    fi
  else
      echo "unknow device" | sed -n 'p'
  fi
}
path(){
#根据不同系统得到路径
#参数路径为win的路径,如果是wsl就在路径前加/mnt
#还可能与设备有关，用户有关等等
  local os=$(get_os)
      local path="$1"

  if [[ "$os" == "wsl" ]]; then
    path="/mnt$path"
  fi

  echo "$path" | sed -n 'p'
}
export conf=$(path "/d/longyi/all_resources/golbal-config")
export longyi=$(path "/d/longyi")

PROMPT_COMMAND=settitle
alias vi='nvim'
alias git-log='git log --pretty=oneline --all --graph --abbrev-commit'

# 还需要一个动态设置窗口的函数
#
export LANG=C.UTF-8

# 当操作系统是












