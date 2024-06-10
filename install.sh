#! /bin/bash

if ["$SEUID" -ne 0]; then
	exit 1
fi


sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y exiftool
sudo apt-get install -y steghide
sudo apt-get install -y binwalk
sudo apt-get install -y sherlock
sudo apt-get install -y gedit
sudo apt-get install -y ffzf

