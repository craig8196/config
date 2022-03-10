#!/bin/bash
# Folders to create symbolic links to on install.
declare -a arr=("Desktop" "Documents" "Downloads"
                "Music"
                "Pictures" "Projects" "Public"
                "Templates"
                "Videos")

for f in "${arr[@]}"
do
    file=~/$f
    if [ ! -L $file ]
    then
        echo "Linking to $file"
        rmdir $file
        ln -s "/mnt/raid/home/craig/$f" "$file"
    else
        echo "Link exists to $file"
    fi
done

# Load paths to locations on RAID5 array
if [ -e "/dev/md2" ]; then
    cp "user-dirs.dirs" ~/.config/
fi

