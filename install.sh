#/bin/bash

D=$(pwd)

ln -s $D/vim ~/.vim

curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

