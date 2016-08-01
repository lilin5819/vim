#!/bin/bash
cd ~
sudo apt-get install vim wget curl vim-addon-manager vim-runtime vim-youcompleteme

curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
[ $? -eq 0 ] || sh <(curl https://j.mp/spf13-vim3 -L)

git clone https://github.com/powerline/fonts && [ -d fonts ] && sudo ./fonts/install 
[ $? -eq 0 ] echo "install powerline fonts successful!" || echo "error install powerline fonts!"

git clone https://github.com/lilin5819/vimzsh
[ -d vimzsh ] && ln -s vimzsh/.vimrc* ~
[ $? -eq 0 ] && echo "ln -s .vimrc* successful!" || echo "error in ln .vimrc*"
[ -e vimzsh/agnosterzak.zsh-theme ] && ln -s vimzsh/agnosterzak.zsh-theme .oh-my-zsh/themes

sudo apt-get install vim-runtime vim-scripts vim-youcompleteme
vam install youcompleteme && grep 'let g:spf13_bundle_g.*youcsompleteme' vimzsh/.vimrc.before.local || echo "let g:spf13_bundle_groups=['general', 'programming', 'misc', 'scala', 'youcompleteme']">> vimzsh/.vimrc.before.local
sudo ln -sf vimzsh/ycm_extra_conf.py /usr/lib/vim-youcompleteme/ycm_extra_conf.py
echo "请在vim中输入 :BundleInstall"

sed -i 's/<C-j>/<C-n>n/g' .vim/bundle/vim-plugins/plugin/*
