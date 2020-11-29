#!/bin/bash
for pkg in ffmpeg 
do
	if pacman -Qs $pkg > /dev/null; then
		echo "$pkg installed"
	else
		echo "$pkg not installed"
		sudo pacman -S $pkg
	fi
done

while true
do
	echo 'Hit q to quit else Enter video file-name with the full-path: '
	read video
	if [[ $video = q ]]
	then
		exit
	fi
	ffmpeg -i $video -c copy -map 0 $video.mp4
done
