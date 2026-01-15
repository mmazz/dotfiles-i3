# installing i3 set up


- Arch
```bash
sudo pacman -S i3-wm i3status i3lock dmenu
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xf86-video-intel
``` 
- Debian

## Priori installing this repository


```bash
echo ".dotfiles-i3" >> .gitignore
git clone --bare https://github.com/mmazz/.dotfiles-i3.git $HOME/.dotfiles-i3
alias gitdotfile='/usr/bin/git --git-dir=$HOME/.dotfiles-i3/ --work-tree=$HOME'
gitdotfile checkout
gitdotfile config --local status.showUntrackedFiles no
``` 
