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
    echo "info: Linux 卸载中......"
    sudo rm -f ~/.bashrc 
    echo "info: Linux 卸载中......"
    sudo rm -rf ~/.git-templates 
    echo "info: Linux 卸载中......"

    echo "info: neovim 卸载中......"
    sudo rm -rf ~/.config/nvim
    echo "info: neovim 配置卸载完成"
    sudo rm -f /usr/local/bin/nvim
    echo "info: neovim bin 卸载完成"
    sudo rm -rf /usr/local/lib/nvim
    echo "info: neovim lib 卸载完成"
    sudo rm -rf /usr/local/man/man1/nvim.1
    echo "info: neovim man 卸载完成"
    sudo rm -rf /usr/local/share/nvim
    sudo rm -rf ~/.local/share/nvim
    echo "info: neovim share 卸载完成"

    echo "info: 全局配置文件卸载完成"
    # sudo rm -rf ~/global-conf
fi
