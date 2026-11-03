#!/bin/sh
# Construye la ISO de INOUT OS. Ejecutar en Debian/Ubuntu con: sudo apt install live-build
# Uso: sudo ./iso/build.sh   (desde la raíz del repositorio)
set -e
cd "$(dirname "$0")"
INC=config/includes.chroot

# Copia los archivos de base/ a la imagen (así no se duplican en el repo).
rm -rf "$INC"
mkdir -p "$INC/opt/inout-os/shell" "$INC/usr/local/bin" \
         "$INC/etc/systemd/system/getty@tty1.service.d" \
         "$INC/etc/skel"
cp ../base/shell/main.qml                    "$INC/opt/inout-os/shell/main.qml"
cp ../base/scripts/inout-shell.sh            "$INC/usr/local/bin/inout-shell"
cp ../base/scripts/xinitrc-kiosk             "$INC/etc/skel/.xinitrc"
cp ../base/scripts/bash_profile-kiosk        "$INC/etc/skel/.bash_profile"
# Usuario live por defecto de live-build: "user"
sed 's/--autologin fran/--autologin user/' \
    ../base/systemd/getty-tty1-autologin.conf \
    > "$INC/etc/systemd/system/getty@tty1.service.d/autologin.conf"

lb clean
lb config
lb build
echo "ISO generada en iso/inout-os-amd64.hybrid.iso"
