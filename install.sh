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

installcocextensions() { \
  # Install extensions
  mkdir -p ~/.config/coc/extensions
  cd ~/.config/coc/extensions
  [ ! -f package.json ] && echo '{"dependencies":{}}'> package.json
  # Change extension names to the extensions you need
  sudo npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
}

installonubuntu() { \
  sudo apt install ranger -y # 1
  sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev -y # 2
  sudo pip3 install ueberzug # 2
  sudo apt-get update # 3
  sudo apt-get install ripgrep # 3
  sudo apt-get install silversearcher-ag # 4
  sudo apt install fd-find # 5
  sudo apt install universal-ctags -y # 6
  sudo add-apt-repository ppa:lazygit-team/release -y # 7
  sudo apt-get install lazygit # 7
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash # 8
  sudo apt install fzf # 9
  pip3 install neovim-remote
}

installextrapackages() { \
  [  -n "$(uname -a | grep Ubuntu)" ] && installonubuntu
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

echo "JNvim is better with at least ripgrep, ueberzug and ranger...etc"
echo -n "Would you like to install these now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installextrapackages || echo "not installing extra packages"

echo "Installing Plugins..."
nvim --headless +PlugInstall +qall > /dev/null 2>&1

installcocextensions

echo "Installation Done!!"
echo "help: whgustlr0326@gmail.com"
