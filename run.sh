#!/bin/bash
OS_VERSION=$(echo "$BALENA_HOST_OS_VERSION" | cut -d " " -f 2)
echo "OS Version is $OS_VERSION"

cd output
mod_dir="wm8960_${BALENA_DEVICE_TYPE}_${OS_VERSION}*"
for each in $mod_dir; do
	echo Loading module from "$each"
	#insmod "$each/snd-soc-wm8960-soundcard.ko"
	insmod "$each/snd-soc-wm8960.ko"
done

while true; do
	sleep 60
done
