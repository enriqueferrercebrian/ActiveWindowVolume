
^!d:: ; Esto es Ctrl + Alt + D para restar 0.1
    ; Ejecuta el script de PowerShell para obtener el nombre del programa de la ventana activa
    RunWait, powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Users\Enrique\Documents\AutoHotkey\get_active_window.ps1", , Hide

    ; Lee el contenido del archivo de texto que contiene el nombre del programa
    FileRead, OutputVar, C:\Users\Enrique\Documents\AutoHotkey\active_program_name.txt

    ; Elimina espacios al inicio y al final del nombre, saltos de línea y retornos de carro
    OutputVar := RegExReplace(OutputVar, "^[\s`r`n]+|[\s`r`n]+$", "")

    ; Muestra el nombre del programa en una ventana emergente para verificar
    ;MsgBox, El nombre del programa es:`n%OutputVar%

    ; Asegúrate de que el nombre del programa no esté vacío
    if (OutputVar != "")
    {
        ; Añadir la extensión .exe al nombre del programa antes de pasarlo a NirCmd
        programWithExtension := OutputVar . ".exe"
        
        ; Leer el volumen actual desde el archivo de texto
        if (FileExist("C:\Users\Enrique\Documents\AutoHotkey\current_volume.txt"))
        {
            FileRead, currentVolume, C:\Users\Enrique\Documents\AutoHotkey\current_volume.txt
        }
        else
        {
            currentVolume := 1.0
            FileAppend, %currentVolume%, C:\Users\Enrique\Documents\AutoHotkey\current_volume.txt
        }

        if (currentVolume = "")
        {
            currentVolume := 1.0
        }
        else
        {
            ; Restar 0.1 al volumen actual
            currentVolume := currentVolume - 0.1

            ; Asegurarse de que el volumen no baje de 0.0
            if (currentVolume < 0.0)
            {
                currentVolume := 0.0
            }
        }
        
        ; Mostrar el volumen actual para verificar
       ; MsgBox, Volumen actual para %programWithExtension% es: %currentVolume%

        ; Guardar el nuevo volumen en el archivo de texto
        FileDelete, C:\Users\Enrique\Documents\AutoHotkey\current_volume.txt
        FileAppend, %currentVolume%, C:\Users\Enrique\Documents\AutoHotkey\current_volume.txt

        ; Ejecutar el comando de NirCmd para ajustar el volumen del programa
        Run, nircmd.exe setappvolume %programWithExtension% %currentVolume%
    }
    else
    {
        MsgBox, No se pudo obtener el nombre del programa activo.
    }
return