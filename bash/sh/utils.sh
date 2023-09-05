get_os() {
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

get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

