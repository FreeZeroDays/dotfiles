#!/bin/bash

DOTS_THEME_FILE="$HOME/.config/oh-my-zsh/parzival.zsh-theme"
OHMYZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/themes/parzival.zsh-theme"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    [[ -f ".zshrc.pre-oh-my-zsh" ]] && mv ".zshrc.pre-oh-my-zsh" ".zshrc"
fi

[ -L "$OHMYZSH_THEME_FILE" ] && rm "$OHMYZSH_THEME_FILE"
ln -s "$DOTS_THEME_FILE" "$OHMYZSH_THEME_FILE"

mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"

echo "Oh My Zsh ✅"
