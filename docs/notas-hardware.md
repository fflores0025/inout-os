# Notas de hardware y problemas conocidos

## HP 250 G9 (i3-1215U) con Debian 13 en Crucial X8 por USB
Fecha: 2026-11-03

### Síntoma
Tras arrancar, un kworker de una CPU queda atascado (`soft lockup`) y
`khugepaged` bloqueado. La shell gráfica parece funcionar (imagen estática),
pero el login por tty y cualquier escritura a disco se quedan colgados.
El atasco empieza a los 15-90 s del arranque, no más tarde.

### Observado
- Errores `rtw_8822ce` (Wi-Fi RTL8822CE): `PCIe Bus Error ... CmpltTO`,
  `failed to send h2c command`.
- Bloquear el módulo (`install rtw88_8822ce /bin/false` en
  `/etc/modprobe.d/rtw.conf` + `update-initramfs -u`) quita esos mensajes,
  pero el soft lockup siguió apareciendo. El Wi-Fi no es la única causa.
- Cambiar puerto/cable USB del X8 no lo resolvió.
- El live USB (Lexar) también iba lento al principio.

### Pendiente de probar (en este orden)
1. Parámetro de kernel `pcie_aspm=off` (probar primero editando la línea
   `linux` en GRUB con `e`, solo para un arranque).
2. `intel_idle.max_cstate=1` o `processor.max_cstate=1`.
3. `usbcore.autosuspend=-1` y forzar `usb-storage` en vez de UAS para el X8
   (`usb-storage.quirks=VID:PID:u`, el ID sale de `lsusb`).
4. Probar otro kernel (backports) si lo anterior no basta.
5. Si no hay forma: desarrollar en VM o en otro equipo y usar este solo para pruebas.

### Para no depender de teclear en el equipo
Desarrollo en el repositorio (GitHub) y el equipo de pruebas solo hace `git pull`.
