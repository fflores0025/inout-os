# ISO de INOUT OS (live-build)

Genera una imagen live de Debian 13 (x86-64) con la shell de INOUT OS en modo kiosco.

## Requisitos
Un Debian/Ubuntu (puede ser una máquina virtual o WSL2 con systemd) con:
`sudo apt install live-build`

## Construir
Desde la raíz del repositorio: `sudo ./iso/build.sh`
Resultado: `iso/inout-os-amd64.hybrid.iso`

## Cómo funciona
- `auto/config`: opciones de live-build (distribución, arquitectura, arranque, idioma).
- `config/package-lists/`: paquetes de la imagen.
- `config/hooks/live/`: ajustes dentro del chroot.
- `build.sh`: copia `base/` (shell, scripts, autologin) a la imagen y lanza `lb build`.

## Estado
Prototipo sin probar. Primer paso: construirla y arrancarla en una VM (QEMU/VirtualBox)
antes de grabarla en un USB. Los usuarios, la contraseña y las ediciones (Kiosk, Terminal,
Control) quedan para una fase posterior.
