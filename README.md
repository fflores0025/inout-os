# INOUT OS

Sistema operativo propio basado en Linux (Debian) para todos los equipos de la corporación InOut Media: kioscos, terminales, puestos de control y más.

## Plan por fases

- [x] Fase 0: entorno de desarrollo (Debian en SSD externo, Git, CMake, GCC)
- [x] Fase 1: Qt 6 y herramientas de desarrollo
- [x] Fase 2: primer prototipo de shell en QML a pantalla completa
- [ ] Fase 3: modo kiosco con systemd y ISO propia con live-build
- [ ] Fase 4: instalador, actualizaciones OTA, ARM / Raspberry Pi, ediciones (Kiosk, Terminal, Control...)

## Estructura

- base/: shell visual e identidad común a todas las ediciones
- editions/: Kiosk, Terminal, Control (una app por edición sobre la base)
- iso/: configuración de live-build para generar la imagen
- docs/: decisiones y notas del proyecto

## Entorno de desarrollo

- Debian 13 (trixie) en Crucial X8 1 TB
- Git, CMake, GCC, Qt 6.8, Qt Creator

## Identidad visual

- Fondo #07070f, acento #c8ff00, cyan #00d4ff
- Propiedad de InOut Event Systems, InOut Media
