path() { echo "$OSTYPE" | grep -q "linux-gnu" && (echo "/mnt$1" | sed -n 'p')|| (echo "$1" | sed -n 'p')}

export conf=$(path "/d/longyi/all_resources/golbal-config")
export long=$(path "/d/longyi")

source $conf/bash/sh/basics.sh   # 基础设置
source $conf/bash/sh/keymap.sh   # 快捷映射
source $conf/bash/sh/theme.sh    # 外表主题
