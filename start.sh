#!/bin/bash
# debugging
set -x

# stop display manager
systemctl stop sddm.service

# stop xow service
systemctl stop xow.service

# unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind

# unbind EFI-framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# avoid race condition
sleep 5

# unload nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r drm_kms_helper
modprobe -r nvidia
modprobe -r i2c_nvidia_gpu
modprobe -r drm
modprobe -r nvidia_uvm

# unbind gpu
virsh nodedev-detach pci_0000_0e_00_0
virsh nodedev-detach pci_0000_0e_00_1

# load vfio
modprobe vfio
modprobe vfio_pci
modprobe vfio_iommu_type1
