<h1 align="center">Global Conf</h1>
<hr/>
各种主机的配置非常繁琐，这里提供了一些常用的配置文件和配置脚本，方便快速配置。目前支持设备Linux、Windows。启动后会自动配置命令行，安装nvim。

# Install
## windows
1. 首先下载scoop，以方便安装各种工具。<br>
在powershell上运行以下命令`iex (new-object net.webclient).downloadstring('https://get.scoop.sh')`
2. 使用scoop安装git `scoop install git`
3. 在用户目录`git clone git@gitee.com:eurybia/global-conf.git`
3. 将Terminal设置为windows默认终端，设置Git bash为Termial默认打开窗口
4. 安装设置hark nerd字体为终端默认字体
5. 在gitbash中运行仓库中的`.install.sh`脚本
6. 在nvim应用中执行：PackerSync命令安装插件，需要执行两次

## linux-ubuntu
1. 在用户目录`git clone git@gitee.com:eurybia/global-conf.git` 
2. 运行仓库中的`.install.sh`脚本
3. 在nvim应用中执行：PackerSync命令安装插件，需要执行两次

# Uninstall
## windows
## linux-Ubuntu
1. 运行仓库中的`.uninstall.sh`脚本
# Framework
```angular2html
.
├── LICENSE
├── README.md
├── automated     # 一些脚本
├── bash
│   └── sh        # 一些bash脚本
│   └── .bashrc   # bash配置文件
├── git           # git配置文件
│   └── hooks
├── nvim          # nvim 配置文件
│   ├── init.lua
│   └── lua
└── resource      # 资源文件
```
# Future
- [ ] windows与wsl 通过符号链接连接
