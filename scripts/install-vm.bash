#!/bin/bash

sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
