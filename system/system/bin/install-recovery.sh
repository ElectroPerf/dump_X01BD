#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:57496876:2a69c3efab0fcaa41119cf0dcc13e24b57e7f5fe; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:51266856:6cb9630e91add093cbc2c4d3e7624c735e972573 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:57496876:2a69c3efab0fcaa41119cf0dcc13e24b57e7f5fe && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
