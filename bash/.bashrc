export conf="$HOME/global-conf"

source $conf/bash/sh/utils.sh
source $conf/bash/sh/basics.sh
source $conf/bash/sh/theme.sh         # 外表主题
source $conf/bash/sh/osa-keymap.sh    # 系统适配与快捷键

export OPENAI_API_KEY="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"
lexport mysql $(path "/d/longyi/all_resources/mysql")
lexport code_repository $(path "/d/code")

source $bashrc_local                  # 引入local_bash

export RUST_BACKTRACE=1 cargo run
alias so="source ~/.bashrc"
