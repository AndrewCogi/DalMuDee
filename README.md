
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

ref: https://www.chrisatmachine.com/Neovim/07-ranger/ 

### 2. ueberzug

***⚠️ must be installed before installing ueberzug***

❗️ `sudo apt install libjpeg8-dev zlib1g-dev python-dev python3-dev libxtst-dev`

ref: https://www.google.co.kr/amp/s/amp.reddit.com/r/linux4noobs/comments/bcmo19/help_installing_ueberzug/

❗️ `sudo pip3 install ueberzug`

ref: https://github.com/seebye/ueberzug 

### 3. ripgrep

❗️ `sudo apt-get update`

❗️ `sudo apt-get install ripgrep`

ref: https://ubuntu.pkgs.org/20.04/ubuntu-universe-amd64/ripgrep_11.0.2-1build1_amd64.deb.html 

### 4. silver_searcher

❗️ `sudo apt-get install silversearcher-ag`

ref: https://github.com/ggreer/the_silver_searcher 

### 5. fd

❗️ `sudo apt install fd-find`

ref: https://github.com/sharkdp/fd 

### 6. universal-ctags

❗️ `sudo apt install universal-ctags` 

### 7. lazy git

❗️ `sudo add-apt-repository ppa:lazygit-team/release`

❗️ `sudo apt-get update`

❗️ `sudo apt-get install lazygit`

ref: https://github.com/jesseduffield/lazygit 

### 8. lazy docker

❗️ `curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash`

ref: https://github.com/jesseduffield/lazydocker 

### 9. fzf

❗️ `sudo apt install fzf` 

### 10. Nodejs(for python LSP)

❗️ `sudo apt-get install curl`

❗️ `curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -`

❗️ `sudo apt-get install -y nodejs`

❗️ `sudo apt install build-essential`

ref: https://soojae.tistory.com/25 

### 11. jedi(for python LSP)

❗️ `sudo apt-get install vim-python-jedi`

❗️ `vim-addons install python-jedi`

ref: https://askubuntu.com/questions/462841/how-to-install-and-use-jedi-vim-python-ide-for-vim-on-ubuntu

***🔑 it's not working?***

ref: https://github.com/palantir/python-language-server/issues/543 

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

**_4._** Reboot ubuntu server & check $JAVA_HOME

❗️ `sudo reboot now`

❗️ `echo JAVA_HOME`

❗️ `$JAVA_HOME/bin/javac -version` -> If you get the same result as `javac-version`, you succeed!

ref: https://all-record.tistory.com/181 

### 2. live-server

⚠️ **portforwarding required!**

❗️ `sudo npm i -g live-server`

***🔑 How to use this?***

❗️ `live-server [filePath] --port=[portNumber] --host=[ipAddress]`

***🔑 help?***

❗️ `live-server -h`

ref: https://www.chrisatmachine.com/Neovim/20-live-server/ 

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

ref: https://linuxize.com/post/how-to-install-gradle-on-ubuntu-20-04/

### 4. Code-Server (VSCode)

### 5. Selenium
