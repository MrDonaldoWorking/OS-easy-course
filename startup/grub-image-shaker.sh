#!/bin/bash

IMG_DIR=/home/donaldo/GrubImage
DESTI_FILE=/usr/share/desktop-base/active-theme/grub/grub-4x3.png

images=($(find $IMG_DIR -name '*.*g*'))
names=("${images[@]}")
images_cnt=${#images[@]}

for i in ${!images[@]}
do
    echo "images[$i] = "${images[$i]}
    if [[ -L ${images[$i]} ]]; then
        images[$i]=$(readlink -f ${images[$i]})
        echo "is the link to ${images[$i]}"
    fi
    
    difference=$(diff "${images[$i]}" $DESTI_FILE)
    if [[ -z $difference ]]; then
        echo "Previous Grub image was: "${images[$i]}
        prev_img=${names[$i]}
    fi
done

index=$(($RANDOM%$images_cnt))
image=${images[$index]}
echo $RANDOM $index $images_cnt $image
# gwenview $image

#pass=`kdialog --title "Set grub background" --password "Enter your sudo password for setting $image to grub background"`

cp "$image" $DESTI_FILE

name=${names[$index]}
if [ $1 -eq 1 ]; then
    sleep 170
fi
kdialog --msgbox "New grub image is "$(echo "${name##*/}")", previously was "$(echo "${prev_img##*/}")

read
