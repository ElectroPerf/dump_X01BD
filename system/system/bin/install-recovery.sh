#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:57500972:f78603e12f23e7bea318658a47849800be8f2b85; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:51270952:88eb31b3136e71250230d36bf585d362212bf548 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:57500972:f78603e12f23e7bea318658a47849800be8f2b85 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
