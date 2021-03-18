#!/bin/bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails


installnodeubuntu() { \
  sudo apt install nodejs -y
  sudo apt install npm -y
}

installnode() { \
  echo "Installing node..."
  [  -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
  sudo npm i -g neovim
}

installpiponubuntu() { \
  sudo apt install python3-pip -y # > /dev/null
}

installpip() { \
  echo "Installing pip..."
  [  -n "$(uname -a | grep Ubuntu)" ] && installpiponubuntu
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

cloneconfig() { \
  echo "Cloning JNvim2.0 configuration"
  git clone https://github.com/CHOHYUNSIK/JNvim2.0.git ~/.config/nvim
}

installplugins() { \
#  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.tmp
#  mv $HOME/.config/nvim/utils/init.vim $HOME/.config/nvim/init.vim
  echo "Installing plugins..."
  nvim --headless +PlugInstall +qall > /dev/null 2>&1
#  mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/utils/init.vim
#  mv $HOME/.config/nvim/init.vim.tmp $HOME/.config/nvim/init.vim
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

pipinstallueberzug() { \
  which pip3 > /dev/null && pip3 install ueberzug || echo "Not installing ueberzug pip not found"
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

# Welcome
echo 'Installing JNvim2.0...'
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "Install Neovim 5.0"
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt install neovim -y

# install pip
which pip3 > /dev/null && echo "pip installed, moving on..." || asktoinstallpip

# install node and neovim support
which node > /dev/null && echo "node installed, moving on..." || asktoinstallnode


# install pynvim
pip3 list | grep pynvim > /dev/null && echo "pynvim installed, moving on..." || installpynvim

# clone config down
cloneconfig

echo "JNvim is better with at least ripgrep, ueberzug and ranger...etc"
echo -n "Would you like to install these now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installextrapackages || echo "not installing extra packages"

# install plugins
which nvim > /dev/null && installplugins

installcocextensions

echo "end"
echo "end"
