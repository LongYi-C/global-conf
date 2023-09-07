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
    rm -rf ~/AppData/Local/nvim/ && mkdir -p ~/AppData/Local/nvim/
    rm -rf ~/.config/nvim/ && ln -s ~/AppData/Local/nvim ~/.config/nvim

    ln -s $SP/nvim/lua/ ~/AppData/Local/nvim/lua
    ln -s $SP/nvim/init.lua ~/AppData/Local/nvim/init.lua
    
    rm -f ~/.wslconfig && ln -s $SP/.wslconfig ~/.wslconfig
    rm -f ~/.ideavimrc && ln -s $SP/.ideavimrc ~/.ideavimrc


    rm -f ~/.bashrc && ln -s $SP/bash/.bashrc ~/.bashrc
    rm -rf ~/.git-templates && ln -s $SP/git ~/.git-templates
    rm -rf $SP/.git/hooks && cp -r $SP/git/hooks $SP/.git/hooks
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo chmod -R 755 $SP
    sudo rm -rf ~/.config/nvim/ && mkdir -p ~/.config/nvim/
    sudo ln -s $SP/nvim/init.lua ~/.config/nvim/init.lua
    sudo ln -s $SP/nvim/lua ~/.config/nvim/lua

    sudo rm -f ~/.bashrc && ln -s $SP/bash/.bashrc ~/.bashrc
    sudo rm -rf ~/.git-templates && ln -s $SP/git ~/.git-templates
    sudo rm -rf $SP/.git/hooks && cp -r $SP/git/hooks $SP/.git/hooks

    # 如果时linux 从rescouce中安装nvim
    sudo rm -f /usr/local/bin/nvim
    sudo cp $SP/resource/nvim /usr/local/bin
fi
# 自动创建ssh公匙
if [[ -f ~/.ssh/id_rsa.pub ]]; then
    echo "SSH public key already exists."
else
    ssh-keygen -t rsa
fi
echo "SSH public key:"
cat ~/.ssh/id_rsa.pub
source ~/.bashrc
