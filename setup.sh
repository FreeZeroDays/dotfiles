#!/bin/bash

SYSTEM_TYPE=$(uname -s)

if [[ "$SYSTEM_TYPE" = "Darwin" || "$SYSTEM_TYPE" = "Linux" ]]; then

    if [ "$SYSTEM_TYPE" = "Linux" ]; then
        sudo apt update && sudo apt -y upgrade && sudo apt install -y build-essential procps curl file git yadm nmap tmux htop kitty imagemagick neofetch && sudo apt -y autoremove
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
        echo "yadm"
    fi

    if [ ! -f "$HOME/.config/yadm/bootstrap" ]; then
        yadm clone https://github.com/DeviantSec/dotfiles --no-bootstrap
    fi
    
    if [ ! -d "$HOME/.backup/" ]; then 
         mkdir "$HOME/.backup/"
    fi 
    
    if [ ! -d "$HOME/.backup/nano" ]; then 
         mkdir "$HOME/.backup/nano"
    fi 

    if [ ! -d "$HOME/.backup/logs" ]; then
	 mkdir "$HOME/.backup/logs"
    fi

# Make bootstrap executable and run
    chmod +x "$HOME/.config/yadm/bootstrap"
    chmod +x $HOME/.config/yadm/bootstrap.d/*
    yadm bootstrap

# Reloading here
         exec zsh
fi
