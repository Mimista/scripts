Write-Host " "
Write-Host -ForegroundColor green "C: Drive Capacity under 80GB" 
Write-Host "======================================================"
Write-Host " "
Set-PSDebug -Trace 0
$ComputerArray = "computer01","winserver01"
#Clear-Host


Foreach ($Computer in $ComputerArray) {
    $TestConnection = Test-Connection -BufferSize 32 -Count 1 -ComputerName $Computer -Quiet
        
        if($TestConnection -eq "True"){
            $FreeSpaceC = [int]((get-WmiObject win32_logicaldisk -filter "deviceid='C:'"-Computername $Computer).FreeSpace/1Gb) 
            $User = (Get-WmiObject -Class win32_process -ComputerName $Computer | Where-Object name -Match explorer).getowner().user
   
                if ($FreeSpaceC -lt 80) {
                    write-host $Computer "|  Last logged in user was:" $User 
                } 
        }
}


Write-Host " "
Write-Host -ForegroundColor red "Unable to connect to:" 

Foreach ($Computer in $ComputerArray) {
    $TestConnection = Test-Connection -BufferSize 32 -Count 1 -ComputerName $Computer -Quiet
        if($TestConnection -ne "True"){
            Write-Host $Computer
        }
}
