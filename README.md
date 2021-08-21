
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

❗️ `bash <(curl -s https://raw.githubusercontent.com/CHOHYUNSIK/DalMuDee/master/install.sh)` 

## Required Installation List (Automatic)

### 1. ranger

❗️ `sudo apt install ranger`

🖇 ref: https://www.chrisatmachine.com/Neovim/07-ranger/ 

### 2. ueberzug

***⚠️ must be installed before installing ueberzug***

❗️ `sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev`

🖇 ref: https://www.google.co.kr/amp/s/amp.reddit.com/r/linux4noobs/comments/bcmo19/help_installing_ueberzug/

❗️ `sudo pip3 install ueberzug`

🖇 ref: https://github.com/seebye/ueberzug 

### 3. ripgrep

❗️ `sudo apt-get update`

❗️ `sudo apt-get install ripgrep`

🖇 ref: https://ubuntu.pkgs.org/20.04/ubuntu-universe-amd64/ripgrep_11.0.2-1build1_amd64.deb.html 

### 4. silver_searcher

❗️ `sudo apt-get install silversearcher-ag`

🖇 ref: https://github.com/ggreer/the_silver_searcher 

### 5. fd

❗️ `sudo apt install fd-find`

🖇 ref: https://github.com/sharkdp/fd 

### 6. universal-ctags

❗️ `sudo apt install universal-ctags` 

### 7. lazy git

❗️ `sudo add-apt-repository ppa:lazygit-team/release`

❗️ `sudo apt-get update`

❗️ `sudo apt-get install lazygit`

🖇 ref: https://github.com/jesseduffield/lazygit 

### 8. lazy docker

❗️ `curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash`

🖇 ref: https://github.com/jesseduffield/lazydocker 

### 9. fzf

❗️ `sudo apt install fzf` 

### 10. Nodejs(for python LSP)

❗️ `sudo apt-get install curl`

❗️ `curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -`

❗️ `sudo apt-get install -y nodejs`

❗️ `sudo apt install build-essential`

🖇 ref: https://soojae.tistory.com/25 

### 11. jedi(for python LSP)

❗️ `sudo apt-get install vim-python-jedi`

❗️ `vim-addons install python-jedi`

🖇 ref: https://askubuntu.com/questions/462841/how-to-install-and-use-jedi-vim-python-ide-for-vim-on-ubuntu

***🔑 it's not working?***

🖇 ref: https://github.com/palantir/python-language-server/issues/543 

### 12. black (python formatter)

❗️ `sudo pip3 install black`

***🔑 Have you already set up the interpreter?***

❗️ nvim -> :CocCommand python.setInterpreter

choose `/bin/python3` 

### 13. ccls(for C/C++ LSP)

❗️ `sudo apt install ccls`

also setting LSP for C/C++ is in `./coc-settings.json` file 

## Required Installation List (Manual)

### 1. Java

⚠️ **jdk jre >= 11 (for jdtls)**

**_1._** Execute the JDK and JRE installation commands.

❗️ `sudo apt-get install openjdk-11-jre`

❗️ `sudo apt-get install openjdk-11-jdk`

**_2._** Check java installation

❗️ `java -version` -> openjdk version "${VAJA_VERSION}"...

❗️ `javac -version` -> javac "${JAVA_VERSION}"

**_3._** Setting Java environment variables(PATH)

**_3-1._** Check javac location & setting ${JAVA_HOME}

❗️ `which javac` -> ${temp}

❗️ `readlink -f ${temp}` -> it will be show the full javac location(I'll call this result as ${RESULT})

**_3-2._** Add PATH in `/etc/profile`

❗️ `sudo nano /etc/profile`

(append this things)

```vim
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export CLASS_PATH=$JAVA_HOME/lib:$CLASS_PATH
```

⚠️ **JAVA_HOME should same the ${RESULT} path shown above.**

**_4._** Source `/etc/profile`

❗️ `source /etc/profile`

**_5._** Reboot ubuntu server & check $JAVA_HOME

❗️ `sudo reboot now`

❗️ `echo JAVA_HOME`

❗️ `$JAVA_HOME/bin/javac -version` -> If you get the same result as `javac-version`, you succeed!

🖇 ref: https://all-record.tistory.com/181 

### 2. live-server

⚠️ **portforwarding required!**

❗️ `sudo npm i -g live-server`

***🔑 How to use this?***

❗️ `live-server [filePath] --port=[portNumber] --host=[ipAddress]`

***🔑 help?***

❗️ `live-server -h`

🖇 ref: https://www.chrisatmachine.com/Neovim/20-live-server/ 

### 3. Gradle

**_1._** Downloading Gradle

At the time of writing this article, the latest version of
Gradle is 6.5.1. Before continuing with the next step, check the 
https://gradle.org/releases/ to see if a newer version is available. 

Downloading the Gradle binary-only zip file in the `/tmp`
directory using the following `wget` command:

❗️ `VERSION=6.5.1`

❗️ `wget https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip -P /tmp`

Once the download is completed, unzip the file in the
`/opt/gradle` directory:

❗️ `sudo unzip -d /opt/gradle /tmp/gradle-${VERSION}-bin.zip`

Gradle is regularly updated with security patches and new features.
To have more control over versions and updates, we’ll create
a symbolic link named `latest`, which points to the Gradle installation directory:

❗️ `sudo ln -s /opt/gradle/gradle-${VERSION} /opt/gradle/latest`

Later, when upgrading Gradle, unpack the newer version and change the symlink to point to it.

**_2._** Setting up the Environment variables

We need to add the Gradle bin directory to the system `PATH`
environment variable. To do so, open your text editor and
create a new file named `gradle.sh` inside of the `/etc/profile.d/` directory.

❗️ `sudo nano /etc/profile.d/gradle.sh`

Paste the following configuration:

```vim
export GRADLE_HOME=/opt/gradle/latest
export PATH=${GRADLE_HOME}/bin:${PATH}
```

Save and close the file. This script will be sourced at shell startup.

Make the script executable:

❗️ `sudo chmod +x /etc/profile.d/gradle.sh`

Load the environment variables in the current shell session using the `source` command:

❗️ `source /etc/profile.d/gradle.sh`

**_3._** Verifying the Gradle Installation

To validate that Gradle is installed properly use the `gradle -v` command which will display the Gradle version:

❗️ `gradle -v`

You should see something like the following:

```
Welcome to Gradle 6.5.1!

Here are the highlights of this release:
 - Experimental file-system watching
 - Improved version ordering
 - New samples

For more details see https://docs.gradle.org/6.5.1/release-notes.html


------------------------------------------------------------
Gradle 6.5.1
------------------------------------------------------------

Build time:   2020-06-30 06:32:47 UTC
Revision:     66bc713f7169626a7f0134bf452abde51550ea0a

Kotlin:       1.3.72
Groovy:       2.5.11
Ant:          Apache Ant(TM) version 1.10.7 compiled on September 1 2019
JVM:          11.0.7 (Ubuntu 11.0.7+10-post-Ubuntu-3ubuntu1)
OS:           Linux 5.4.0-26-generic amd64
```

That’s it. You have installed the latest version of Gradle
on your Ubuntu system, and you can start using it.

🖇 ref: https://linuxize.com/post/how-to-install-gradle-on-ubuntu-20-04/

***🔑 Help***

Execute without executing bar

🖇 ref: https://stackoverflow.com/questions/52690759/how-do-i-get-rid-of-the-executing-progress-bar-when-running-a-gradle-application

Scanner NoSuchInputException?

🖇 ref: https://stackoverflow.com/questions/36723447/java-util-scanner-throws-nosuchelementexception-when-application-is-started-with

### 4. Code-Server (VSCode)

❗️ `sudo curl -fsSL https://code-server.dev/install.sh | sh`

***🔑 How to use?***

auto execution on

❗️ `systemctl --user enable --now code-server`

auto execution off

❗️ `systemctl --user disable --now code-server`

The configuration file is in `~/.config/code-server/config.yaml`
Also, you can set https using AWS.

🖇 ref: http://hakawati.co.kr/445

### 5. Selenium (venv)

❗️ `python3 -m venv ${YOUR_DIR}`

ex) python3 -m venv ~/selenium

***🔑 How to use?***

activate venv

❗️ `source <venv>/bin/activate`

deactivate venv

❗️ `deactivate`

🖇 ref: https://docs.python.org/ko/3/library/venv.html

## Plugins Included

<details open>
  <summary><strong>List</strong> <small><i>(Click to expand/collapse)</i></small></summary>

| Name           | Description
| -------------- | ----------------------
| [tpope/vim-commentary] | Comment maker
| [suy/vim-context-commentstring] | Determining the right character at comment
| [rafi/awesome-colorschemes] | Awesome color-schemes
| [vim-airline/vim-airline] | Lean & mean status/tabline for vim that's light as air
| [vim-airline/vim-airline-themes] | A collection of themes for vim-airline
| [enricobacis/vim-airline-clock] | Vim-airline clock extension
| [tpope/vim-speeddating] | Increment dates, times, and more
| [tpope/vim-repeat] | Enable repeating supported plugin maps
| [unblevable/quick-scope] | Lightning fast left-right movement in Vim
| [easymotion/vim-easymotion] | Vim motions on speed!
| [tpope/vim-surround] | Quoting/parenthesizing made simple
| [edkolev/promptline.vim] | Generate a fast shell prompt with powerline symbols and airline colors
| [airblade/vim-rooter] | Changes Vim working directory to project root
| [octol/vim-cpp-enhanced-highlight] | C/C++ syntax highlight
| [vim-python/python-syntax] | Python syntax highlighting script
| [uiiaoo/java-syntax.vim] | java syntax highlight
| [jiangmiao/auto-pairs] | Insert or delete brackets, parens, quotes in pair
| [alvan/vim-closetag] | Auto close (X)HTML tags
| [neoclide/coc.nvim] | Intelliscence
| [kevinhwang91/rnvimr] | Make Ranger running in a floating window to communicate with Neovim via RPC
| [junegunn/fzf] | Command-line fuzzy finder
| [junegunn/fzf.vim] | Command-line fuzzy finder for Vim
| [wookayin/fzf-ripgrep.vim] | +fzf-ripgrep
| [voldikss/vim-floaterm] | Terminal manager
| [liuchengxu/vista.vim] | Viewer & Finder for LSP symbols and tags
| [mbbill/undotree] | The undo history visualizer
| [psliwka/vim-smoothie] | Smooth scrolling
| [airblade/vim-gitgutter] | Git gutter
| [tpope/vim-fugitive] | Awesome git wrapper
| [rhysd/git-messenger.vim] | Reveal the commit messages under the cursor
| [wesQ3/vim-windowswap] | Swap your windows without ruining your layout
| [mhinz/vim-startify] | The fancy start screen
| [skywind3000/asynctasks.vim] | Modern Task System for Project Building, Testing and Deploying
| [skywind3000/asyncrun.vim] | Run Async Shell Commands
| [szw/vim-maximizer] | Maximizes and restores the current window

[tpope/vim-commentary]: https://github.com/tpope/vim-commentary
[suy/vim-context-commentstring]: https://github.com/suy/vim-context-commentstring
[rafi/awesome-colorschemes]: https://github.com/rafi/awesome-vim-colorschemes
[vim-airline/vim-airline]: https://github.com/vim-airline/vim-airline
[vim-airline/vim-airline-themes]: https://github.com/vim-airline/vim-airline-themes
[enricobacis/vim-airline-clock]: https://github.com/enricobacis/vim-airline-clock
[tpope/vim-speeddating]: https://github.com/tpope/vim-speeddating
[tpope/vim-repeat]: https://github.com/tpope/vim-repeat
[unblevable/quick-scope]: https://github.com/unblevable/quick-scope
[easymotion/vim-easymotion]: https://github.com/easymotion/vim-easymotion
[tpope/vim-surround]: https://github.com/tpope/vim-surround
[edkolev/promptline.vim]: https://github.com/edkolev/promptline.vim
[airblade/vim-rooter]: https://github.com/airblade/vim-rooter
[octol/vim-cpp-enhanced-highlight]: https://github.com/octol/vim-cpp-enhanced-highlight
[vim-python/python-syntax]: https://github.com/vim-python/python-syntax
[uiiaoo/java-syntax.vim]: https://github.com/uiiaoo/java-syntax.vim
[jiangmiao/auto-pairs]: https://github.com/jiangmiao/auto-pairs
[alvan/vim-closetag]: https://github.com/alvan/vim-closetag
[neoclide/coc.nvim]: https://github.com/neoclide/coc.nvim
[kevinhwang91/rnvimr]: https://github.com/kevinhwang91/rnvimr
[junegunn/fzf]: https://github.com/junegunn/fzf
[junegunn/fzf.vim]: https://github.com/junegunn/fzf.vim
[wookayin/fzf-ripgrep.vim]: https://github.com/wookayin/fzf-ripgrep.vim
[voldikss/vim-floaterm]: https://github.com/voldikss/vim-floaterm
[liuchengxu/vista.vim]: https://github.com/liuchengxu/vista.vim
[mbbill/undotree]: https://github.com/mbbill/undotree
[psliwka/vim-smoothie]: https://github.com/psliwka/vim-smoothie
[airblade/vim-gitgutter]: https://github.com/airblade/vim-gitgutter
[tpope/vim-fugitive]: https://github.com/tpope/vim-fugitive
[rhysd/git-messenger.vim]: https://github.com/rhysd/git-messenger.vim
[wesQ3/vim-windowswap]: https://github.com/wesQ3/vim-windowswap
[mhinz/vim-startify]: https://github.com/mhinz/vim-startify
[skywind3000/asynctasks.vim]: https://github.com/skywind3000/asynctasks.vim
[skywind3000/asyncrun.vim]: https://github.com/skywind3000/asyncrun.vim
[szw/vim-maximizer]: https://github.com/szw/vim-maximizer

</details>

## Help!

***🔑 How to use git-ssh?***

🖇 ref: https://www.google.com/amp/s/jootc.com/p/201905122827/amp

***🔑 Git commands***

🖇 ref: https://medium.com/@joongwon/git-git-%EB%AA%85%EB%A0%B9%EC%96%B4-%EC%A0%95%EB%A6%AC-c25b421ecdbd
