$hostname = Read-host "Name of the computer to check hardware from "
$User = (Get-WmiObject -Class win32_process -ComputerName $hostname | Where-Object name -Match explorer).getowner().user

#Clear before starting
Clear-Host

#Basic info
Write-Host " "
Write-Host -ForegroundColor green "Computer Name $hostname | Last logged in user:" $User
Write-Host "----------------------------------------------------"

    # Get computer serial
        $SerialNumber = (Get-WMIObject -ComputerName $hostname win32_bios).SerialNumber#win32_computerSystem -ComputerName $hostname | Select-object Manufacturer, Model | Format-List)
    # Manufacturer
        $Manufacturer = (Get-WMIObject -ComputerName $hostname win32_bios).Manufacturer
    #Get RAM amount
        $RAM = [Math]::Round((Get-WmiObject win32_computersystem -ComputerName $hostname).TotalPhysicalMemory/1Gb)
    #Model Name
        $Model = (Get-WmiObject -ComputerName $hostname -Class:Win32_ComputerSystem).Model

    #Windows version
        $WindowsVersion = (Get-WmiObject -ComputerName $hostname Win32_OperatingSystem).Version
    #GPU name
        $GPU = (Get-WmiObject -ComputerName $hostname Win32_VideoController).Caption
    #CPU model
        $CPU = (Get-WmiObject -ComputerName $hostname Win32_Processor).Name
    
    #Print out results
        
        Write-Host "Windows version:" $WindowsVersion
        Write-Host "SerialNumber:" $SerialNumber
        Write-Host "Manufacturer:" $Manufacturer
        Write-Host "Model:" $Model
        Write-Host "RAM: " $RAM"GB" 
        Write-Host "GPU:"$GPU
        Write-Host "CPU:"$CPU


