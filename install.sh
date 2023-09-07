#!/bin/bash

# windows先在powershell中执行以下命令下载scoop，然后下载git
# iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
# scoop install git

# 在用户目录中: git clone git@gitee.com:eurybia/global-conf.git
# cd global-conf
# ./instal.sh
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
	MSYS=winsymlinks:nativestrict
    # 如果时win下载scoop，下载nvim
    # scoop install nvim
    rm -rf ~/AppData/Local/nvim/ && mkdir -p ~/AppData/Local/nvim/

    ln -s $PWD/nvim/init.lua ~/AppData/Local/nvim/init.lua
    ln -s $PWD/nvim/lua/ ~/AppData/Local/nvim/lua
    
    rm -f ~/.wslconfig && ln -s $PWD/.wslconfig ~/.wslconfig
    rm -f ~/.ideavimrc && ln -s $PWD/.ideavimrc ~/.ideavimrc


rm -f ~/.bashrc && ln -s $PWD/bash/.bashrc ~/.bashrc

rm -rf ~/.git-templates && ln -s $PWD/git ~/.git-templates
rm -rf $PWD/.git/hooks && cp -r $PWD/git/hooks ./.git/hooks

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
# 如果时linux 从rescouce中按爪u那个nvim
sudo rm -f /usr/local/bin/nvim
    sudo cp $PWD/resource/nvim /usr/local/bin
    sudo chmod -R 755 /usr/local/bin/nvim
    sudo rm -rf ~/.config/nvim/ && mkdir -p ~/.config/nvim/

    sudo ln -s $PWD/nvim/init.lua ~/.config/nvim/init.lua
    sudo ln -s $PWD/nvim/lua ~/.config/nvim/lua

	sudo rm -f ~/.bashrc && ln -s $PWD/bash/.bashrc ~/.bashrc
sudo rm -rf ~/.git-templates && ln -s $PWD/git ~/.git-templates
sudo rm -rf $PWD/.git/hooks && cp -r $PWD/git/hooks ./.git/hooks
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
