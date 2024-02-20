#!/bin/bash

#Updating system
sudo apt update
sudo apt upgrade -y

#Adding conrib, non-free
sudo apt install software-properties-common -y
sudo apt-add-repository contrib non-free -y
sudo apt update

#Installing packages
PACKAGES="dkms firmware-linux firmware-linux-nonfree
clang clangd llvm lldb clang-tidy valgrind gdb universal-ctags git cmake-gui
python3-dev python3-pip python-is-python3 python3-venv
ranger vlc curl wget filezilla qbittorrent
pkg-config libglfw3-dev libassimp-dev libgl1-mesa-dev libvulkan-dev
libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev
flatpak podman net-tools vde2
qemu-kvm qemu-system qemu-utils 
libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager"
sudo apt -y install $PACKAGES

#Add user to groups
USER_GROUPS="libvirt,libvirt-qemu,kvm,input,disk,dialout"
sudo usermod -aG $USER_GROUPS $USER

#Enable default network
sudo virsh net-autostart default

#Add git
git config --global user.email "nvolkov.job@gmail.com"
git config --global user.name "landaybronstein"

#Add Flathub
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
