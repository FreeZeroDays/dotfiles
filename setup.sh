#!/bin/bash

SYSTEM_TYPE=$(uname -s)

if [[ "$SYSTEM_TYPE" = "Darwin" || "$SYSTEM_TYPE" = "Linux" ]]; then

    # Removing .zshrc and .bashrc if they already exist..
    [ -e $HOME/.zshrc ] && rm $HOME/.zshrc
    [ -e $HOME/.bashrc ] && rm $HOME/.bashrc

    if [ "$SYSTEM_TYPE" = "Linux" ]; then
        sudo apt update && sudo apt -y upgrade && sudo apt install -y build-essential procps curl file git zsh yadm tmux htop kitty imagemagick neofetch && sudo apt -y autoremove
    fi
    
    # Switch to zsh
    if [[ "$SHELL" != *"zsh" ]]; then
    sudo chsh -s $(which zsh)
    fi

    if [[ "$SYSTEM_TYPE" = "Darwin" ]] && [ ! command -v brew >/dev/null 2>&1 ]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew ✅"
    fi

    if [[ "$SYSTEM_TYPE" = "Darwin" ]] && [ ! xcode-select --print-path &>/dev/null ]; then
        xcode-select --install
        echo "Xcode cli tools ✅"
    fi

    if [[ "$SYSTEM_TYPE" = "Darwin" ]] && [ ! brew list yadm >/dev/null ]; then
        brew install yadm
        echo "yadm ✅"
    fi
    
    if [ ! -f "$HOME/.config/yadm/bootstrap" ]; then
        yadm clone https://github.com/DeviantSec/dotfiles --no-bootstrap
    fi
    
    if [ ! -d "$HOME/.backup/" ]; then 
         mkdir "$HOME/.backup/"
	 echo "Backup Directory ✅"
    fi 
    
    if [ ! -d "$HOME/.backup/nano" ]; then 
         mkdir "$HOME/.backup/nano"
	 echo "Nano Logging ✅"
    fi 

    if [ ! -d "$HOME/.backup/logs" ]; then
	 mkdir "$HOME/.backup/logs"
	 echo "Logging all the commands! ✅"
    fi

# Make bootstrap executable and run
    chmod +x "$HOME/.config/yadm/bootstrap"
    chmod +x $HOME/.config/yadm/bootstrap.d/*
    yadm bootstrap
    
    exec zsh
fi
