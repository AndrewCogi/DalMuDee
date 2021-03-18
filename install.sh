#!/bin/bash

set -o nounset		#미선언 변수 접근 시 에러처리
set -o errexit		#커맨드 실패하면 바로 중지

installnodeubuntu() { \
  sudo apt install nodejs -y
  sudo apt install npm -y
}

installpiponubuntu() { \
  sudo apt install python3-pip -y # > /dev/null
}

installnode() { \
  echo "Installing node..."
  [  -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
  sudo npm i -g neovim
}

installpip() { \
  echo "Installing pip..."
  [  -n "$(uname -a | grep Ubuntu)" ] && installpiponubuntu
}

asktoinstallnode() { \
  echo "node not found"
  echo -n "Would you like to install node now (y/n)? "
  read answer
  [ "$answer" != "${answer#[Yy]}" ] && installnode && installcocextensions
}

asktoinstallpip() { \
  echo "pip not found"
  echo -n "Would you like to install pip now (y/n)? "
  read answer
  [ "$answer" != "${answer#[Yy]}" ] && installpip
}

installpynvim() { \
  echo "Installing pynvim..."
  pip3 install pynvim --user
}

echo "Welcome to JNvim2.0"

echo "Start Installing JNvim2.0..."
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "Install neovim 5.0..."
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt install neovim -y

# Installing pip
which pip3 > /dev/null && echo "pip installed, moving on..." || asktoinstallpip

# install node and neovim support
which node > /dev/null && echo "node installed, moving on..." || asktoinstallnode

# install pynvim
pip3 list | grep pynvim > /dev/null && echo "pynvim installed, moving on..." || installpynvim

# echo "Install prerequisites..."
# sudo apt install clang -y

echo "Cloning JNvim2.0 Configuration..."
git clone https://github.com/CHOHYUNSIK/JNvim2.0.git ~/.config/nvim

echo "Installing Plugins..."
nvim --headless +PlugInstall +qall > /dev/null 2>&1
