[[ $(get_os) == "win" ]] && source "$conf/bash/sh/windows.sh" || source "$conf/bash/sh/linux.sh"

alias vi='nvim'
alias py='python'

alias git-log='git log --pretty=oneline --all --graph --abbrev-commit'
alias git-push='git push origin HEAD'

git config --global user.name "longyi"
git config --global user.email "longyi.c@qq.com"
