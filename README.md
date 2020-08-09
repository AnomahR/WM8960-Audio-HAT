Containerized version of the driver installation to be deployed on https://www.balena.io/os/.

Note: Since the boot partition of BalenaOS is read-only, add the `wm8960-soundcard.dtbo` file to the `overlays/` folder before flashing the image onto the Raspberry Pi. Also add the following lines to the `config.txt` file of the boot partition on the SD card:

```
dtparam=i2s=on
dtoverlay=i2s-mmap
dtoverlay=wm8960-soundcard
```

After deploying the project to my Pi Zero, I changed the DT parameters as suggested in the [DAC configuration] setting the custom configuration variable `BALENA_HOST_CONFIG_dtoverlay` to "wm8960-soundcard".
