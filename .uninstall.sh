#!/bin/bash

# windows先在powershell中执行以下命令下载scoop，然后下载git
# iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
# scoop install git

# 在用户目录中: git clone git@gitee.com:eurybia/global-conf.git
# cd global-conf
# ./instal.sh
SP=$(dirname "$(readlink -f "$0")")

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
MSYS=winsymlinks:nativestrict
    # 如果时win下载scoop，下载nvim
    # scoop install nvim
    rm -rf ~/.config/nvim
    rm -rf ~/AppData/Local/nvim
    rm -f ~/.wslconfig  
    rm -f ~/.ideavimrc 
    rm -f ~/.bashrc 
    rm -rf ~/.git-templates 
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo rm -f ~/.bashrc 
    sudo rm -rf ~/.git-templates 

    sudo rm -f /usr/local/bin/nvim
    sudo rm -rf ~/.config/nvim
    sudo rm -rf ~/.local/share/nvim
fi
