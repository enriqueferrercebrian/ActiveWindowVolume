# Volume Control for Active Windows

This project allows you to control the volume of the active window using hotkeys. You can adjust the volume of a specific application by pressing `Ctrl + Alt + U` to increase the volume or `Ctrl + Alt + D` to decrease it. The volume adjustments are persistent and are saved between uses.

---

Este proyecto te permite controlar el volumen de la ventana activa utilizando teclas de acceso rápido. Puedes ajustar el volumen de una aplicación específica presionando `Ctrl + Alt + U` para aumentar el volumen o `Ctrl + Alt + D` para disminuirlo. Los ajustes de volumen son persistentes y se guardan entre usos.

## Files Overview

- `VolumeActiveWindowsUp.ahk`: AutoHotkey script to increase the volume of the active window by 0.1.
- `VolumeActiveWindowsDown.ahk`: AutoHotkey script to decrease the volume of the active window by 0.1.
- `reload.ahk`: AutoHotkey script that monitors changes in the above scripts and reloads them if modified.
- `get_active_window.ps1`: PowerShell script that retrieves the name of the active window.
- `active_program_name.txt`: Text file that stores the name of the active program.
- `current_volume.txt`: Text file that stores the current volume level for the active window.

---

### Archivos del Proyecto

- `VolumeActiveWindowsUp.ahk`: Script de AutoHotkey para aumentar el volumen de la ventana activa en 0.1.
- `VolumeActiveWindowsDown.ahk`: Script de AutoHotkey para disminuir el volumen de la ventana activa en 0.1.
- `reload.ahk`: Script de AutoHotkey que monitorea cambios en los scripts anteriores y los recarga si se modifican.
- `get_active_window.ps1`: Script de PowerShell que recupera el nombre de la ventana activa.
- `active_program_name.txt`: Archivo de texto que guarda el nombre del programa activo.
- `current_volume.txt`: Archivo de texto que guarda el volumen actual de la ventana activa.

## How to Use

1. Install [AutoHotkey](https://www.autohotkey.com/) on your system.
2. Install [NirCmd](https://www.nirsoft
