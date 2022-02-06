function snapshot_after {

    Param(
    [String]$ID,
    [String]$CompatibilityModeSO
    )

if(Test-Path -Path "./snapshot_after"){
    #Write-Host "La carpeta ya existe"
}else{
    New-Item -ItemType "directory" -Path "./snapshot_after"
}
        
}