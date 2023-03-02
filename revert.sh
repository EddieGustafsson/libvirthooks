#!/bin/bash
# debug
set -x

# unload vfio-pci
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Rebind GPU
virsh nodedev-reattach pci_0000_0e_00_0
virsh nodedev-reattach pci_0000_0e_00_1

# Rebind VTconsoles
echo 1 > /sys/class/vtconsole/vtcon0/bind

# read nvidia x config
nvidia-xconfig --query-gpu-info > /dev/null 2>&1

# bind efi-framebuffer
echo "efi-framebuffer.0" > /sys/bus/platform/driver/efi-framebuffer/bind

# load nvidia
modprobe nvidia_drm
modprobe nvidia_modeset
modprobe drm_kms_helper
modprobe nvidia
modprobe drm
modprobe nvidia_uvm

# start xow service
systemctl start xow.service

# restart display service
systemctl start sddm.service
