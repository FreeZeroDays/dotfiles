# How to Install

Run following command:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/DeviantSec/dotfiles/master/setup.sh)"
```
Please be wary that these are my dotfiles and not everything may be suitable to your liking. Be careful if you plan on running the command above.


# FAQ

### How do you add an image to neofetch?

- You can change neofetch's config to use an image instead. You can find more info in their [wiki](https://github.com/dylanaraps/neofetch/wiki/Image-Backends). For example, I changed following variables in my [config.conf](https://github.com/DeviantSec/dotfiles/tree/master/.config/neofetch) to show Gura in my neofetch:
```
image_backend="kitty"
image_source="$HOME/.config/neofetch/gura.png"
 ```
 
### What does "rice" mean?

- From [r/unixporn's wiki](https://www.reddit.com/r/unixporn/wiki/themeing/dictionary/#wiki_rice):

> "Rice" is a word that is commonly used to refer to making visual improvements and customizations on one's desktop. It was inherited from the practice of customizing cheap Asian import cars to make them appear to be faster than they actually were - which was also known as "ricing". Here on r/unixporn , the word is accepted by the majority of the community and is used sparingly to refer to a visually attractive desktop upgraded beyond the default.

### Why a .zshrc and .bashrc?

- Because I have accepted that zsh is significantly better than bash but bash still has a special place in my heart. :) 

---

If you got any more questions, feel free to create a [new issue](https://github.com/DeviantSec/dotfiles/issues/new)
Additionally, these dotfiles were inspired partly by [ZhongXiLu](https://github.com/ZhongXiLu). I highly recommend checking out their repo to view their dotfiles!
