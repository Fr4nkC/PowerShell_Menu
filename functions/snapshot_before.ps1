function snapshot_before {

    Param(
    [String]$ID,
    [String]$CompatibilityModeSO
    )

if(Test-Path -Path "./snapshot_before"){
    #Write-Host "La carpeta ya existe"
}else{
    New-Item -ItemType "directory" -Path "./snapshot_before"
}
        
}