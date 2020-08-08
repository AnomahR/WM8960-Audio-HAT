KERNEL_TREE_PATH?=/lib/modules/$(shell uname -r)/build
EXTRA_CFLAGS="-DDEBUG"

snd-soc-wm8960-objs := wm8960.o
snd-soc-wm8960-soundcard-objs := wm8960-soundcard.o


obj-m += snd-soc-wm8960.o
obj-m += snd-soc-wm8960-soundcard.o

all:
	make -C $(KERNEL_TREE_PATH) M=$(PWD) modules

clean:
	make -C $(KERNEL_TREE_PATH) M=$(PWD) clean

install:
	sudo cp snd-soc-wm8960.ko /lib/modules/$(shell uname -r)/kernel/sound/soc/codecs/
	sudo cp snd-soc-wm8960-soundcard.ko /lib/modules/$(shell uname -r)/kernel/sound/soc/bcm/
	sudo depmod -a
