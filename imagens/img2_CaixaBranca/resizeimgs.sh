#!/bin/bash
mkdir "../resizeimg"

for f in *.bmp 
do 
	echo " "
	echo "$f" 
	convert "$f" -resize 250 "../resizeimg/$f"

done

