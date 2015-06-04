#sudo /usr/local/bin/qemu-system-x86_64  -m 256M -bios ./u-boot.rom -nographic  -net nic,vlan=0 -net tap,vlan=0 -hdb cf.qcow2 
sudo /usr/local/bin/qemu-system-x86_64 -m 256M -bios ./u-boot.rom -nographic  -net nic,vlan=0 -net tap,vlan=0 -device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=0x8 -drive file=cf.qcow2,if=none,id=drive-scsi0-0-0-0,format=qcow2 -device scsi-hd,bus=scsi0.0,channel=0,scsi-id=0,lun=0,drive=drive-scsi0-0-0-0,id=scsi0-0-0-0


exit

setenv serverip 172.20.0.1
setenv ipaddr 172.20.0.2
setenv bootargs rootfstype=ramfs console=ttyS0 debug rdinit=/sbin/init kgdboc=ttyS0 debug 
tftpboot 

tftp 0x3000000 initrd.img

zboot 0x1000000 0x598220 0x3000000 0x342b000 
