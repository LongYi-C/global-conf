[[ $(get_os) == "win" ]] && source "$conf/bash/sh/windows.sh" || source "$conf/bash/sh/linux.sh"

alias vi='nvim'
alias py='python'

alias git-log='git log --pretty=oneline --all --graph --abbrev-commit'
alias git-push='git push origin HEAD'

