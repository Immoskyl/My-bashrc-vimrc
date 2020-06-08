# custom bashrc
# made by Romain Roux
# 
# contains fragments of other very useful bashrc for a fancier more ergonomic prompt and console use
# contains self made shorcut commands


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
        case $- in
            *i*) ;;
              *) return;;
        esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
        HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
        shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
        HISTSIZE=1000
        HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
        shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
        if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
            debian_chroot=$(cat /etc/debian_chroot)
        fi

# set a fancy prompt (non-color, unless we know we "want" color)
        case "$TERM" in
            xterm-color) color_prompt=yes;;
        esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

        if [ -n "$force_color_prompt" ]; then
            if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
            color_prompt=yes
            else
            color_prompt=
            fi
        fi

        if [ "$color_prompt" = yes ]; then
            PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        else
            PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        fi
        unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
        case "$TERM" in
        xterm*|rxvt*)
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
            ;;
        *)
            ;;
        esac

# enable color support of ls and also add handy aliases
        if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
            alias dir='dir --color=auto'
            alias vdir='vdir --color=auto'

            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
        fi
        alias pegr='grep -v'

# some more ls aliases
    alias ll='ls --color=auto -l'
    alias la='ls --color=auto -A'
    alias lal='ls --color=auto -al'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

        if [ -f ~/.bash_aliases ]; then
            . ~/.bash_aliases
        fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
        if ! shopt -oq posix; then
          if [ -f /usr/share/bash-completion/bash_completion ]; then
            . /usr/share/bash-completion/bash_completion
          elif [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
          fi
        fi



#---------------------------------------------------------------------
#---------------------------------------------------------------------
        # PERSO



#:q fait exit
        alias ":q"='exit'
        alias ":q!"='exit'
        alias "close"='exit'

#compilateur g++
        alias g++='clear; g++ -std=c++11 -w -Wall -Werror -Wextra -pedantic' 

#compilateur g++
        alias gcc='clear; gcc -ansi -Wall -Wextra -lcunit ' 

#dÃ©place dans un dossier et affiche son contenu
    function cd () {
        if [ -z "$1" ]; then
            builtin cd
        else
            builtin cd "$*" &&  ls | cat && echo -e ''; 
        fi 
    } 


#colorie le prompt
        PS1='\[\e[1;97m\][\u@\h \W]\$\[\e[0m\]'


#raccourci vers bashrc et vimrc
        alias bashrc='vim ~/.bashrc'
        alias vimrc='vim ~/.vimrc'

#raccourci apt-get
        alias apt='sudo apt-get install'

#clear
        alias cl='clear'

#cd ..
        alias cd..='cd ..' 

#raccourci git *
        alias github='cd /var/www'

#raccourci makefile sans expandtab
        alias Make='vim -c "set noexpandtab" ~/.Makefile'

#raccourci aliases
        alias aliases='alias'

#raccourci diff
        alias diff2='diff'

#raccourci pour utiliser le Makefile de l'utilisateur
    function Makefile () {

        Localisation=$PWD
        NomDuScript=\.Makefile\.${LOGNAME}swp

        cp ~/.Makefile ./$NomDuScript
        chmod 700 $NomDuScript
        ./$NomDuScript

        PID='pgrep -f $NomDuScript'
        while [[ ( -d /proc/$PID ) && ( -z `grep zombie /proc/$PID/status` ) ]]
        do
            sleep 1
        done
        rm $NomDuScript
    }

#raccourci pour yield
        alias yield='clear; cat net-home/.YIELD'

#raccourci pour yield encore plus
    function YIELD () {

        local Location='net-home/.YIELD'
        local NbMaxLines=`wc -L $Location | cut -d' ' -f1`

        for ((i=1; i<=$NbMaxLines; i++))
        do
            cut -c1-$i $Location
            sleep 0.01
            clear
        done
        while true
        do
            cat ~/net-home/.YIELD
            sleep 0.3
            clear
            sleep 0.3
        done
    }

#lance une VM Windows XP

    alias VMwinxp='/usr/local/bin/mkwxpnat.bash'

#raccourci inversion de grep


#raccourci de changement de polices

    alias RU='setxkbmap ru'
    alias CH='setxkbmap ch'

#raccourci close

    alias close='exit'

#raccourci ping

    alias pingtest='ping -Bc 3 -w 10 -W 20 www.google.fr'


#raccourci set clavier fr at login

    setxkbmap fr


#raccourci pour lancer l'explorateur de fichier depuis le terminal

    alias filebrowser='pcmanfm'
    alias explorer='pcmanfm'


#raccourci pour annuler ^D (fermer le shell)

    set -o ignoreeof 

#raccourci pour custom le logout

    logout(){
        clear
        echo "SWAG"
        sleep 0.2
        exit 0
    }
    trap logout 0


#raccourci pour lancer ArgoUML

    alias argouml='java -jar ~/argouml-0.34/argouml.jar'


##raccourci pour setup Hadoop
#
#    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
#    export HADOOP_HOME=/home/romain/hadoop-2.8.4/
#    export PATH=$PATH:$HADOOP_HOME/bin
#
## added by Anaconda3 2018.12 installer
## >>> conda init >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/romain/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/home/romain/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/romain/anaconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="/home/romain/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda init <<<


alias julia='/home/romain/julia-1.1.0/bin/julia'

alias itg='cowsay nique ta mÃ¨re'
