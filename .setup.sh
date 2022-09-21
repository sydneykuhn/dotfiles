#!/bin/bash
#
# Setting up a new EC2 instance
#
# Commands to enter before running this program
#
# sudo apt udpate
# sudo apt install -y git
# git clone https://github.com/sydneykuhn/dotfiles.git
# cd ./dotfiles && sh ./setup.sh
#
# Now the code will run automatically

echo Updating and upgrading system
sudo apt-get update
sudo apt-get full-upgrade -y

echo Configuring Git
git config --global user.email "sydney.kuhn@mths.ca"
git config --global user.name "Sydney Kuhn"
git config --global init. defaultBranch main
git config --global pull.rebase true
git config --global fetch.prune true

echo Setting up GitHub SSH key
echo "Enter 3 times"
ssh-keygen -t ed25519 -C "sydney.kuhn@mths.ca"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo "Copy key and add to GitHub"
echo "Press enter to continue"
read any_key
echo "Type yes"
echo "Press enter"
read any_key
ssh -T git@github.com

echo Get requirements
sude apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg config unzip curl doxygen
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
