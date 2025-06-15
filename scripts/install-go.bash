#!/bin/bash

wget https://go.dev/dl/go1.24.4.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.24.4.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' >>~/.zshrc
