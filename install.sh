#! /bin/bash

if ["$SEUID" -ne 0]; then
	exit 1
fi


sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y exiftool
sudo apt-get install -y steghide
sudo apt-get install -y binwalk
sudo apt-get install -y python3 python3-pip git
git clone https://github.com/sherlock-project/sherlock.git
cd sherlock || exit
python3 -m pip install -r requirements.txt
echo 'export PATH=$PATH:~/sherlock' >> ~/.zshrc
source ~/.zshrc
