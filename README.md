# installing i3 set up


- Arch
```bash
sudo pacman -S i3-wm i3status i3lock dmenu
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xf86-video-intel xf86-video-amdgpu
sudo pacman -S alacritty git base-devel fd clang tree-sitter-cli feh
sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd
sudo pacman -S xss-lock picom pavucontrol lxappearance neovim zsh luarocks curl
sudo pacman -S zathura zathura-pdf-poppler
sudo pacman -S unclutter nsxiv maim xclip
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm --now
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

Configure the ssh key and only once:
```bash
gitdotfile push -u origin main
```


### After:
```bash
sudo git clone https://github.com/zdharma-continuum/fast-syntax-highlighting /usr/share/zsh/plugins/fast-syntax-highlighting
```
