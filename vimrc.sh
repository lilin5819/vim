#!/bin/bash

inst_vimdeps()
{
    sudo apt-get install vim git wget curl \
        vim-addon-manager vim-scripts vim-runtime vim-youcompleteme -y
    vam install youcompleteme
    [ $? != 0 ] && echo '下载vim依赖失败'
}

conf_vim()
{
    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh &&\
        sh spf13-vim.sh || sh <(curl https://j.mp/spf13-vim3 -L)

    [ $? != 0 ] && echo 'fork配置失败'
}


conf_vimlocal()
{
    git clone https://github.com/powerline/fonts && [ -d fonts ] && sudo ./fonts/install.sh
    git clone https://github.com/lilin5819/vimzsh
    sudo ln -sf vimzsh/ycm_extra_conf.py /usr/lib/vim-youcompleteme/ycm_extra_conf.py
    [ -d vimzsh ] && ln -s vimzsh/.vimrc* ~/
    [ $? != 0 ] && echo "vim私有配置失败"
}


#sed -i 's/<C-j>/<C-n>n/g' .vim/bundle/vim-plugins/plugin/*

inst_vimdeps >> ~/vimzh.log

conf_vim >> ~/vimzsh.log

conf_vimlocal >> ~/vimzsh.log

[ $? == 0 ] && echo "请在vim中输入 :BundleInstall" \
    || echo "配置失败，请查看~/vimzsh.log"
