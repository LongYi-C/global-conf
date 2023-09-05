source $conf/bash/sh/utils.sh

alias vi='nvim'
alias git-log='git log --pretty=oneline --all --graph --abbrev-commit'

# 还需要一个动态设置窗口的函数

alias py='python'

# 如果系统是win，则添加lns=winpty mklink,ln=winpty mklink/d
# 如果是Linux系统，则将lns=ln -s

