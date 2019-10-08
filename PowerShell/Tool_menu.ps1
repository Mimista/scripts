Function Menu
{
    param (
        [string]$Title = 'Sysadmin tools'
    )
    Clear-Host
    Write-Host "===================== $Title ====================="

    Write-Host "1: Press [1] to gather computer information"
    Write-Host "2: Press [2] to check harddrive capacity"
    Write-Host "q: Press [q] to quit"


}

do
 {
    Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
     cls
     Write-Host "Gather hardware information from user"
     & C:\Powershell/Hardware_info.ps1
    }
    '2' {
    cls
    Write-Host "Hard drive capacity"
    & C:\Powershell/capacity.ps1
   }
    }
    pause 
 }
 until ($selection -eq 'q')
