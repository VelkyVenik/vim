#!/bin/bash

D=$(pwd)

ln -s $D/vimrc ~/.vimrc
ln -s $D/eslintrc ~/.eslintrc

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

