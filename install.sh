#/bin/bash

D=$(pwd)

if [-d "./vim"]; then mkdir vim

ln -s $D/vimrc ~/.vimrc
ln -s $D/vim ~/.vim

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

