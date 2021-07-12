
<h1 align="center">
DalMuDee🌙
</h1>

<p align="center">
My Personal Integrated Development Environment
</p>

## Introduction

When I was serving in the military, the environment for programming was bad.
So I started this project with the idea of creating my own development environment.

## Features

* Has a development environment for C/C++, Java, Python, HTML, css, js
* Based on the Neovim editor, programming can be done efficiently and quickly without a mouse
* Increase convenience by installing Plugins.
* Auto completion
* Works perfectly in CommandLine Interface
* Use ssh,mosh to access and programing anytime, anywhere
* Code-Server (VSCode)
* Debugging
* Can use Gradle to manage projects (Java,C++ etc.)
* Implement GUI modification, perusal, and editing using live-server

## Prerequisites

* Ubuntu 16.04 or higher
* Python3 (❗️ `sudo apt install python3`)
* pip3 (❗️ `sudo apt install python3-pip`)

## Installation

**Install my settings in ONE command**

❗️ `bash <(curl -s https://raw.githubusercontent.com/CHOHYUNSIK/DalMuDee/master/install.sh)

## Required Installation List

##### 1. ranger

❗️ `sudo apt install ranger`

ref: https://www.chrisatmachine.com/Neovim/07-ranger/

##### 2. ueberzug

***⚠️ must be installed before installing ueberzug***

❗️ `sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev`

ref: https://www.google.co.kr/amp/s/amp.reddit.com/r/linux4noobs/comments/bcmo19/help_installing_ueberzug/

❗️ `sudo pip3 install ueberzug`

ref: https://github.com/seebye/ueberzug

##### 3. ripgrep

❗️ `sudo apt-get update`

❗️ `sudo apt-get install ripgrep`

ref: https://ubuntu.pkgs.org/20.04/ubuntu-universe-amd64/ripgrep_11.0.2-1build1_amd64.deb.html

##### 4. silver_searcher

❗️ `sudo apt-get install silversearcher-ag`

ref: https://github.com/ggreer/the_silver_searcher

##### 5. fd

❗️ `sudo apt install fd-find`

ref: https://github.com/sharkdp/fd

##### 6. universal-ctags

❗️ `sudo apt install universal-ctags`

##### 7. lazy git

❗️ `sudo add-apt-repository ppa:lazygit-team/release`

❗️ `sudo apt-get update`

❗️ `sudo apt-get install lazygit`

ref: https://github.com/jesseduffield/lazygit

##### 8. lazy docker

❗️ `curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash`

ref: https://github.com/jesseduffield/lazydocker

##### 9. fzf

❗️ `sudo apt install fzf`
