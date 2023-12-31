[[ $(get_os) == "win" ]] && source "$conf/bash/sh/windows.sh" || source "$conf/bash/sh/linux.sh"

alias vi='nvim'
alias py='python'

git config --global user.name "longyi"
git config --global user.email "longyi.c@qq.com"
git config --global core.editor "nvim"

git-pull(){
    git pull origin develop 
}

git-log(){ 
    git log --pretty=oneline --all --graph --abbrev-commit 
}
git-push(){  
    git add .  
    read -p "请输入commit注释：" message
    echo $message
    git commit -m "$message"  
    git push origin main:develop  
}

lalias docker-start "$undifine"

