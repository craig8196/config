#! /bin/bash
# Execute from one directory up.

# Copy current vim configurations.
if [ -f .vimrc ]; 
then
    rm .vimrc
else
    echo "No .vimrc to replace."
fi
ln config/.vimrc .vimrc

