#!/bin/bash

IMG_DIR=/home/donaldo/GrubImage

images=($(find $IMG_DIR -name '*.*g*'))
images_cnt=${#images[@]}

for i in ${!images[@]}
do
    echo "images[$i] = "${images[$i]}
    if [[ -L ${images[$i]} ]]; then
        images[$i]=$(readlink -f ${images[$i]})
        echo "is the link to ${images[$i]}"
    fi
done

index=$(($RANDOM%$images_cnt))
image=${images[$index]}
echo $RANDOM $index $images_cnt $image
# gwenview $image

#pass=`kdialog --title "Set grub background" --password "Enter your sudo password for setting $image to grub background"`

cp "$image" /usr/share/desktop-base/active-theme/grub/grub-4x3.png

if [ $1 -eq 1 ]; then
    sleep 70
fi
kdialog --msgbox "New grub image is "$(echo "${image##*/}")
