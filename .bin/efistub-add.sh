#!/bin/sh

params="root=UUID=00b91760-9229-45b5-9763-02daae064882 rootfstype=ext4 psi=1 rw \
  initrd=\intel-ucode.img \
  initrd=\initramfs-lts"

efibootmgr --create --label "Alpine Linux" \
  --disk /dev/sda --part 1 \
  --loader /vmlinuz-lts \
  --unicode "${params}" \
  --verbose
