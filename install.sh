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
	installnodeubuntu
	sudo npm i -g neovim
}

installpip() { \
	echo "Installing pip..."
	installpiponubuntu
}

asktoinstallnode() { \
	echo "node not found"
	echo -n "Would you like to install node now (y/n)? "
	read answer
	[ "$answer" != "${answer#[Yy]}" ] && installnode
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

installonubuntu() { \
	sudo apt install ranger -y # 1
	sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev -y # 2
	sudo pip3 install ueberzug # 2
	sudo apt-get update # 3
	sudo apt-get install ripgrep # 3
	sudo apt-get install silversearcher-ag # 4
	sudo apt install fd-find # 5
	sudo apt install universal-ctags -y # 6
	curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash # 7
	sudo apt install fzf # 8
	pip3 install neovim-remote
}

installextrapackages() { \
	installonubuntu
}

installcocextensions() { \
	# Install extensions
	mkdir -p ~/.config/coc/extensions
	cd ~/.config/coc/extensions
	[ ! -f package.json ] && echo '{"dependencies":{}}'> package.json
	# Change extension names to the extensions you need
	sudo npm install coc-explorer
}

installCppLSP(){
	echo "install clangd"
	sudo apt install clangd -y
}

installPythonLSP(){
	echo "install Nodejs"
	sudo apt-get install curl
	curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
	sudo apt-get install -y nodejs
	sudo apt install build-essential

	echo "install jedi"
	sudo pip3 install -U jedi
	# sudo apt-get install vim-python-jedi
	# vim-addons install python-jedi

	echo "install formatter 'black'"
	sudo pip3 install black
}

installCppDebug(){
	echo "install cpp debugger"
	sudo apt install sed gdb -y
}

installLiveServer(){
	echo "install live-server"
	sudo npm i -g live-server
	echo "you should do portforwarding!!!"
}

installEog(){
	echo "install eog(Image viewer)"
	sudo apt install eog -y
	echo "this will help you use matplotlib"
}

echo "Welcome to DalMuDee"

echo "Start Installing DalMuDee..."
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "Start Installing neovim..."
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

echo "Cloning DalMuDee Configuration..."
git clone https://github.com/CHOHYUNSIK/DalMuDee.git ~/.config/nvim

echo "DalMuDee is better with at least ripgrep, ueberzug and ranger...etc"
echo -n "Would you like to install these now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installextrapackages || echo "not installing extra packages"

echo "Installing Plugins..."
nvim +PlugInstall +qall 

echo "Installing coc-extensions..."
installcocextensions

echo -n "Would you like to install c,c++ LSP now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installCppLSP || echo "not installing CppLSP"

echo -n "Would you like to install python LSP now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installPythonLSP || echo "not installing PythonLSP"

echo -n "Would you like to install c,c++ Debugger now?(gdb)  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installCppDebug || echo "not installing CppDebugger"

echo -n "Would you like to install live-server now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installLiveServer || echo "not installing live-server"

echo -n "Would you like to install eog(Image viewer) now?  (y/n)? "
read answer
[ "$answer" != "${answer#[Yy]}" ] && installEog || echo "not installing eog"

echo "Installation Done!!"
echo "help: whgustlr0326@gmail.com"
