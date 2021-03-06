#!/bin/bash

SYSTEM_TYPE=$(uname -s)

if [[ "$SYSTEM_TYPE" = "Darwin" || "$SYSTEM_TYPE" = "Linux" ]]; then

    wget https://raw.githubusercontent.com/FreeZeroDays/dotfiles/master/.zshrc -O ~/.zshrc
    echo "Grabbed custom .zshrc ✅"
     
    wget https://github.com/FreeZeroDays/dotfiles/blob/master/.bashrc -O ~/.bashrc
    echo "Grabbed custom .bashrc ✅"
    
    if [ "$SYSTEM_TYPE" = "Linux" ]; then
        sudo apt update && sudo apt install -y libwacom-common build-essential procps bat curl file git zsh yadm tmux htop kitty imagemagick neofetch && sudo apt -y autoremove
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
        yadm clone https://github.com/FreeZeroDays/dotfiles -f
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
    
fi

# Start ZSH
exec zsh
