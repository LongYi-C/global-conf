export conf="$HOME/global-conf"

source $conf/bash/sh/utils.sh
source $conf/bash/sh/basics.sh
source $conf/bash/sh/theme.sh         # 外表主题
source $conf/bash/sh/osa-keymap.sh    # 系统适配与快捷键

lexport mysql_volume $undefined
lexport code_repository $(path "/d/code")

source $bashrc_local                  # 引入local_bash
