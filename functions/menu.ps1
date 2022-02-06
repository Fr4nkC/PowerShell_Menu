function menu {

    Param(
    [String]$Fecha,
    [String]$HostName,
    [String]$Ip,
    [String]$versionSO,
    [String]$CompatibilityModeSO,
    [String]$ID
    )

    ## ----  Mostrar Menú.
    Write-Host "*--------------------------------------------------------------------------------*"
    Write-Host "* Fecha: Ejecución_$Fecha"
    Write-Host "* Nombre del servidor: $HostName"
    Write-Host "* IP: $Ip"
    Write-Host "* Sistema Operativo detectado: $versionSO"
    Write-Host "* Modo de compatibilidad: $CompatibilityModeSO"
    Write-Host "* ID para esta ejecución: $ID"
    Write-Host "*--------------------------------------------------------------------------------*"
    Write-Host "* 1.- ."
    Write-Host "* 2.- .."
    Write-Host "* 3.- ..."
    Write-Host "* q.- Salir"
    Write-Host ""
        
}