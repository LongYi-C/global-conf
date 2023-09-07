source $conf/bash/sh/utils.sh

function settitle(){
  # 窗口名-win/wsl/lin@设备名：工作目录最后一个文件夹名
  echo -ne "\033]0$(hostname):$(whoami):$(pwd)\007"
  # 命令行名称
  PS1="\[\033[1;36m\]\h@\u\[\033[1;32m\][\w\[\033[1;36m\]$(get_git_branch)\[\033[1;32m\]]\n\[\033[1;33m\]->\[\033[0m\]"
}
PROMPT_COMMAND=settitle
