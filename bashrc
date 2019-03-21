#!/bin/bash

cd "Desktop/Workspace (local)/seacom4"
alias build='C:\\Python27\\python.exe ~/Desktop/Workspace\ \(local\)/build_s4/buildS4\.py'
alias release_seacom4='C:\\Python27\\python.exe ~/Desktop/Workspace\ \(local\)/release_s4/releaseS4\.py'


export LC_ALL=fr_FR.UTF-8
export LANG=fr_FR.UTF-8
export LANGUAGE=fr_FR.UTF-8


alias close='exit'
alias pingtest='ping -Bc 3 -w 10 -W 20 www.google.fr'
alias cl='clear'
alias cd..='cd ..' 
alias lal='ls -al' 
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias ":q"='exit'
alias ":q!"='exit'
alias filebrowser='start .'
alias pip='/c/Python27/Scripts/pip.exe'
alias python='/c/Python27/python.exe'
alias pyinstaller='/c/Python27/Scripts/pyinstaller.exe --onefile'

function cd () {
    if [ -z "$1" ]; then
        builtin cd
    else 
        builtin cd "$*" && ls | cat && echo -e ''; 
    fi 
}