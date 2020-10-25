#!/bin/bash

sudo apt-get install $1

echo "sudo apt-get install $1" >> ~/source/bin/setup_scratch.sh
