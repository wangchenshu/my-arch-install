#!/bin/bash

# Install my tools
sudo pacman -S vim curl git tmux fish zsh
sudo pacman -S htop screenfetch cowsay tree
sudo pacman -S wget nmap
sudo pacman -S openssh
sudo pacman -S emacs
sudo pacman -S plank
sudo pacman -S docker
sudo pacman -S code

# Install fcitx
sudo pacman -S fcitx fcitx-chewing fcitx-im kcm-fcitx fcitx-table-extra

sudo su
echo export GTK_IM_MODULE=fcitx > ~/.xprofile
sed -i '$a export QT_IM_MODULE=fcitx' ~/.xprofile
sed -i '$a export XMODIFIERS="@im=fcitx"' ~/.xprofile

# Install yay
cd ~/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

## install asciiquarium
### Install term-animation
sudo pacman -S perl-curses
cd /tmp
wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.6.tar.gz
tar -zxvf Term-Animation-2.6.tar.gz
cd Term-Animation-2.6
perl Makefile.PL &&  make && make test

### install Asciiquarium
cd /tmp
wget --no-check-certificate http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
tar -zxvf asciiquarium.tar.gz
cd asciiquarium_1.1
sudo cp asciiquarium /usr/local/bin/
sudo chmod 0755 /usr/local/bin/asciiquarium

# Install oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

## install oh my fish
curl -L https://get.oh-my.fish | fish

exit 0
