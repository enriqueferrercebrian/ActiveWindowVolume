#Persistent  ; Mantener el script corriendo
SetTimer, CheckFiles, 1000  ; Verificar cada 1000 ms (1 segundo)
return

CheckFiles:
; Verificar la fecha de la última modificación de los archivos
FileGetTime, lastModifiedDown, %A_ScriptDir%\VolumeActiveWindowsDown.ahk  
FileGetTime, lastModifiedUp, %A_ScriptDir%\VolumeActiveWindowsUp.ahk  

; Si los archivos han sido modificados, recargarlos
if (lastModifiedDown != lastCheckedDown)
{
    Run, %A_ScriptDir%\VolumeActiveWindowsDown.ahk  ; Recargar el script VolumeActiveWindowsDown.ahk
    lastCheckedDown := lastModifiedDown  ; Actualizar la fecha de la última comprobación de VolumeActiveWindowsDown
}

if (lastModifiedUp != lastCheckedUp)
{
    Run, %A_ScriptDir%\VolumeActiveWindowsUp.ahk  ; Recargar el script VolumeActiveWindowsUp.ahk
    lastCheckedUp := lastModifiedUp  ; Actualizar la fecha de la última comprobación de VolumeActiveWindowsUp
}

return
