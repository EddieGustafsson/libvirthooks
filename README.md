# libvirthooks

PCI 00.0

```xml
<hostdev mode="subsystem" type="pci" managed="yes">
  <source>
    <address domain="0x0000" bus="0x0e" slot="0x00" function="0x0"/>
  </source>
  <rom file="/mnt/nvme1n1p1/patch.rom"/>
  <address type="pci" domain="0x0000" bus="0x08" slot="0x00" function="0x0"/>
</hostdev>
```

PCI 00.1
```xml
<hostdev mode="subsystem" type="pci" managed="yes">
  <source>
    <address domain="0x0000" bus="0x0e" slot="0x00" function="0x1"/>
  </source>
  <rom file="/mnt/nvme1n1p1/patch.rom"/>
  <address type="pci" domain="0x0000" bus="0x06" slot="0x00" function="0x0"/>
</hostdev>

```
