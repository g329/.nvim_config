#!/bin/bash
echo "*** install nvim ! ***"
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim
