Add-Type @"
using System;
using System.Runtime.InteropServices;
using System.Diagnostics;
public class WinAPI {
    [DllImport("user32.dll")]
    public static extern IntPtr GetForegroundWindow();
    [DllImport("user32.dll")]
    public static extern int GetWindowThreadProcessId(IntPtr hWnd, out uint processId);
}
"@

# Obtén el identificador de la ventana activa
$hWnd = [WinAPI]::GetForegroundWindow()

# Verifica si obtuvimos un hWnd válido
if ($hWnd -eq [IntPtr]::Zero) {
    Write-Host "No se pudo obtener la ventana activa."
    exit
}

# Declaramos la variable $processId con el tipo correcto [System.UInt32]
[System.UInt32]$processId = 0

# Obtén el ID de proceso asociado con la ventana activa
[WinAPI]::GetWindowThreadProcessId($hWnd, [ref]$processId)

# Verifica si obtuvimos un processId válido
if ($processId -eq 0) {
    Write-Host "No se pudo obtener el ID de proceso."
    exit
}

Write-Host "ID de proceso obtenido: $processId"

# Obtén el proceso basado en el ID de proceso
try {
    $process = Get-Process -Id $processId -ErrorAction Stop
    $processName = $process.ProcessName
} catch {
    Write-Host "Error al obtener el proceso: $_"
    $processName = "No se pudo obtener el nombre del proceso"
}

Write-Host "Nombre del proceso: $processName"

# Guarda el nombre del proceso en el archivo de texto
$processName | Out-File "C:\Users\Enrique\Documents\AutoHotkey\active_program_name.txt"

# Usar NirCmd para ajustar el volumen de la aplicación
# Asegúrate de que nircmd.exe esté en la misma carpeta que este script o proporciona la ruta completa
$nirCmdPath = "C:\path\to\nircmd.exe"  # Cambia esta ruta a donde tengas nircmd.exe
$volumeLevel = 0.5  # Cambia esto al volumen que desees, 0.0 es mudo, 1.0 es el volumen máximo

# Ejecutar NirCmd para cambiar el volumen de la aplicación activa
Start-Process "$nirCmdPath" -ArgumentList "changeappvolume", $processName, $volumeLevel

Write-Host "Volumen ajustado para $processName"
