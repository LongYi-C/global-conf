[[ $(get_os) == "win" ]] && source "$conf/bash/sh/windows.sh" || source "$conf/bash/sh/linux.sh"

alias vi='nvim'
alias py='python'

git config --global user.name "longyi"
git config --global user.email "longyi.c@qq.com"
git config --global core.editor "nvim"

alias git-log='git log --pretty=oneline --all --graph --abbrev-commit'
alias git-pull='git pull origin develop'
function git-push(){  
    git add .  
    read message -p "请输入commit注释："
    git commit -m "$message"  
    git push origin main:develop  
}
lalias docker-start "$undifine"

