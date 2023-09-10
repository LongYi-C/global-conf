[[ $(get_os) == "win" ]] && source "$conf/bash/sh/windows.sh" || source "$conf/bash/sh/linux.sh"

alias vi='nvim'
alias py='python'

git config --global user.name "longyi"
git config --global user.email "longyi.c@qq.com"

alias git-log='git log --pretty=oneline --all --graph --abbrev-commit'
alias git-push='git push origin main:develop'
alias git-pull='git pull origin develop'

lalias docker-start "$undifine"

