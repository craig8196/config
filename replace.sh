#! /bin/bash
# Execute from one directory up.

if [ -f .vimrc ]; 
then
    rm .vimrc
else
    echo "No .vimrc to replace."
fi
ln Config/.vimrc .vimrc

