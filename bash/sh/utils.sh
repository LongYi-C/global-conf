function get_os() {
  # 判断win-wsl-lin-mac
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [[ -d "/mnt/c" ]]; then
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

function get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export bashrc_local="$HOME/.bashrc_local"  
export undefined="尚未在.bashrc_local处定义"  

function lexport() {      
    if grep -q "\<$1\>" "$bashrc_local" ; then 
      :
    else     
        echo "变量 $1 不存在于文件 $bashrc_local 中"      
        # # 在这里可以执行其他操作，比如退出脚本或输出一些信息  
        echo -e "export $1=\"$2\"" >> $bashrc_local  # 注意这里的双引号
    fi
}  
function lalias() {
    if grep -q "\<$1\>" "$bashrc_local" ; then 
        :
    else     
        echo "变量 $1 不存在于文件 $bashrc_local 中"      
        # # 在这里可以执行其他操作，比如退出脚本或输出一些信息  
        echo -e "alias $1=\"$2\"" >> $bashrc_local  # 注意这里的双引号
    fi
}
