#!/bin/bash
UEFI_DIR=uefi/EFI/Boot/
OVMF_PATH=/usr/share/qemu/OVMF.fd

echo "Building"
cargo build 
echo "copying"
mkdir -p $UEFI_DIR
cp target/x86_64-unknown-uefi/debug/bootloader-rust.efi $UEFI_DIR/Bootx64.efi
qemu-system-x86_64 -bios $OVMF_PATH -drive format=raw,file=fat:rw:target:uefi/
