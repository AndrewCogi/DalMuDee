#!/bin/bash

set -o nounset		#미선언 변수 접근 시 에러처리
set -o errexit		#커맨드 실패하면 바로 중지

echo "Welcome to JNvim2.0"
echo "Start Installing JNvim2.0..."
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "Install neovim 5.0..."
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt install neovim -y

echo "Cloning JNvim2.0 Configuration..."
git clone https://github.com/CHOHYUNSIK/JNvim2.0.git ~/.config/nvim

echo "apply .promptline.sh file"
source ~/.config/nvim/.promptline.sh
