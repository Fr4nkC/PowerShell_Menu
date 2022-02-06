<#===================================================================================#

.SYNOPSIS
 -

.DESCRIPTION
 -

.PARAMETER
 -

.INPUTS
 -

.OUTPUTS
 -

.EXAMPLE
 -

.NOTES
    Author: Fr4nkC
    Requisito: PowerShell Versión 3 o superior.
    
.LINK 
    https://github.com/Fr4nkC
    Version: 01.00.00
     
#===================================================================================#>

## ---- Incluir funciones.
. './functions/snapshot_before.ps1'
. './functions/snapshot_after.ps1'
. './functions/menu.ps1'

## ---- Fecha actual.
$Fecha = Get-Date -UFormat "de_%d_%m_%Y_a_las_%T"
$Fecha = $Fecha -replace '[\:]', '_'

## ---- Generar ID.
$ID = Get-Date -UFormat "%d%m%Y%T"
$ID = $ID -replace '[\:]', ''

## ---- Nombre del servidor.
$HostName = Hostname

## ---- Versión del Sistema Operativo.
$versionSO = (Get-WmiObject -class Win32_OperatingSystem).Caption

## ---- Modo de compatibilidad basado en la versión del Sistema Operativo.
$ArrayVersionSO = (Get-WmiObject -class Win32_OperatingSystem).Caption | ForEach-Object{($_ -split " ")}

## ---- IP.
$Ip = Get-NetIPAddress | Select -expandproperty IPAddress
$Ip = $Ip -match '(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])' | Select-String -Pattern '127.0.0.1' -NotMatch

    foreach ($pice in $ArrayVersionSO)
    {
    
        # Server's
        if($pice -eq '2019'){
            $CompatibilityModeSO = '2019'
        }

        if($pice -eq '2016'){
            $CompatibilityModeSO = '2016'
        }

        # Desktop's
        if($pice -eq '10'){
            $CompatibilityModeSO = '10'
        }

        if($pice -eq '8'){
            $CompatibilityModeSO = '8'
        }

    }

## ---- Determinar si el script es compatible con el Sistema Operativo.
if($CompatibilityModeSO){

    ## ---- Crear respaldo antes de la actividad.
    snapshot_before $ID $CompatibilityModeSO

    do
    {
        ## ---- Limpiar pantalla
        Clear-Host
        
        ## ---- Mostrar Menú
        menu $Fecha $HostName $IP $versionSO $CompatibilityModeSO $ID

        ## ---- Ejecuciones de acuerdo al Menú
        $opcion = Read-Host "Opción:"
        switch ($opcion)
        {
                 '1' {
                    Write-Host "Opción 1"
               } '2' {
                    Write-Host "Opción 2"
               } '3' {
                    Write-Host "Opción 3"
               } 'q' {
                   ## ---- Crear respaldo después de la actividad.
                   snapshot_after $ID $CompatibilityModeSO
               } default {
                    Write-Host "Opción no valida."
               }

         }
         pause

    }
    until ($opcion -eq 'q')

}else{
    Write-Host "El Script no es compatible con este Sistema Operativo."
}