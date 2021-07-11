# Neovim in ubuntu 20.04 (CHOHYUNSIK)

## Install my settings in one Command

❗️ bash <(curl -s https://raw.githubusercontent.com/CHOHYUNSIK/JNvim2.0/master/install.sh)

## How to ssh key fingerprint delete (Blink Shell)

❗️ ssh-keygen -R [host name]

## Basic setting when you first run ubuntu

❗️ sudo apt update

❗️ sudo apt upgrade

❗️ sudo apt autoremove

## Installing pip3 to run install.sh

❗️ sudo apt install python3-pip

## Install nvim

❗️ sudo add-apt-repository ppa:neovim-ppa/unstable

❗️ sudo apt update

❗️ sudo apt install neovim

## Required Installation List

##### 1. ranger

❗️ sudo apt install ranger

ref: https://www.chrisatmachine.com/Neovim/07-ranger/

##### 2. ueberzug

##### (downthings) must be installed before installing ueberzug

❗️ sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev

ref: https://www.google.co.kr/amp/s/amp.reddit.com/r/linux4noobs/comments/bcmo19/help_installing_ueberzug/

❗️ sudo pip3 install ueberzug

ref: https://github.com/seebye/ueberzug

##### 3. ripgrep

❗️ sudo apt-get update

❗️ sudo apt-get install ripgrep

ref: https://ubuntu.pkgs.org/20.04/ubuntu-universe-amd64/ripgrep_11.0.2-1build1_amd64.deb.html

##### 4. silver_searcher

❗️ sudo apt-get install silversearcher-ag

ref: https://github.com/ggreer/the_silver_searcher

##### 5. fd

❗️ sudo apt install fd-find

ref: https://github.com/sharkdp/fd

##### 6. universal-ctags

❗️ sudo apt install universal-ctags

##### 7. lazy git

❗️ sudo add-apt-repository ppa:lazygit-team/release

❗️ sudo apt-get update

❗️ sudo apt-get install lazygit

ref: https://github.com/jesseduffield/lazygit

##### 8. lazy docker

❗️ curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

ref: https://github.com/jesseduffield/lazydocker

##### 9. fzf

❗️ sudo apt install fzf


## Vim command
ref: https://lhjin.tistory.com/entry/VI-VIM명령어-정리


## Install c++/c LSP

❗️ sudo apt install ccls

## Install java

##### (LSP setting is already done)

❗️ jdk jre >= 11 (for jdtls) 현재 최신: 13

ref: https://all-record.tistory.com/181

❗️ test: make test.java file.

## Install python LSP

##### Node.js 최신버전 설치

❗️ sudo apt-get install curl

❗️ curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

❗️ sudo apt-get install -y nodejs

❗️ sudo apt install build-essential

ref: https://soojae.tistory.com/25

##### jedi 최신버전 설치

❗️ sudo apt-get install vim-python-jedi

❗️ vim-addons install python-jedi

ref: https://askubuntu.com/questions/462841/how-to-install-and-use-jedi-vim-python-ide-for-vim-on-ubuntu

##### 그래도 안된다면 여기 참고

ref: https://github.com/palantir/python-language-server/issues/543

##### Formatter black 설치

❗️ sudo pip3 install black

##### 혹시나 선택지에서 1. yes를 선택했었다면, 수동설정해주자

❗️ nvim ->

:CocCommand <CR>

python.setInterpreter

여기에서 /bin/python3 골라주기!!

## HTML live-server

### portforwarding required!!

##### Installation

❗️ sudo npm i -g live-server

##### 실행

ref: https://www.chrisatmachine.com/Neovim/20-live-server/

❗️ live-server [filePath] --port=[portNumber] --host=[ipAddress]

##### help

❗️ live-server -h

ref: https://github.com/tapio/live-server

## Install gradle

ref: https://linuxize.com/post/how-to-install-gradle-on-ubuntu-20-04/

### Gradle Info

executing bar 없애고 실행하기

ref: https://stackoverflow.com/questions/52690759/how-do-i-get-rid-of-the-executing-progress-bar-when-running-a-gradle-application

Scanner NoSuchInputException 해결

ref: https://stackoverflow.com/questions/36723447/java-util-scanner-throws-nosuchelementexception-when-application-is-started-with

## VSCode (Code-Server)

설치
❗️ sudo curl -fsSL https://code-server.dev/install.sh | sh

자동실행 on

❗️ systemctl --user enable --now code-server

자동실행 off

❗️ systemctl --user disable --now code-server

설정파일

❗️ vim .config/code-server/config.yaml

WAS를 사용하여 https 설정까지

ref: http://hakawati.co.kr/445

## Selenium venv (가상환경 python)

ref: https://docs.python.org/ko/3/library/venv.html
