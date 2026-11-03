# Arranque en modo kiosco (Debian 13, X11)

Estado: probado a mano en HP 250 G9 (2026-11-03). Funciona hasta la shell.

## Piezas
- `base/shell/main.qml` -> `/opt/inout-os/shell/main.qml`
- `base/scripts/inout-shell.sh` -> `/usr/local/bin/inout-shell`
- `base/scripts/xinitrc-kiosk` -> `~/.xinitrc`
- `base/scripts/bash_profile-kiosk` -> final de `~/.bash_profile`
- `base/systemd/getty-tty1-autologin.conf` -> `/etc/systemd/system/getty@tty1.service.d/autologin.conf`
- LightDM desactivado: `sudo systemctl disable lightdm`

## Paquetes
`sudo apt install -y qt6-base-dev qt6-declarative-dev qml6-module-qtquick qml6-module-qtquick-controls qml6-module-qtquick-window qml6-module-qtquick-layouts openbox xinit`

## Volver atrás
Desde otra consola (Ctrl+Alt+F2):
`sudo rm /etc/systemd/system/getty@tty1.service.d/autologin.conf && sudo systemctl enable lightdm`

## Nota
Estos pasos se automatizarán en la ISO (`iso/`, live-build); no se repiten a mano.
