#!/bin/bash
OS_VERSION=$(echo "$BALENA_HOST_OS_VERSION" | cut -d " " -f 2)
echo "OS Version is $OS_VERSION"

is_1a=$(i2cdetect -y  1 0x1a 0x1a | egrep "(1a|UU)" | awk '{print $2}')

if [ "x${is_1a}" != "x" ] ; then
	echo "WM8960 soundcard found, loading kernel module"
	cd output
	mod_dir="wm8960_${BALENA_DEVICE_TYPE}_${OS_VERSION}*"
	for each in $mod_dir; do
		echo Loading module from "$each"
		#insmod "$each/snd-soc-wm8960-soundcard.ko"
		insmod "$each/snd-soc-wm8960.ko"
	done
	alsactl restore
fi

while true; do
	sleep 60
done
