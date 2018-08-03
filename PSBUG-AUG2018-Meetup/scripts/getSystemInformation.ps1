$DiskInformation = Get-CimInstance -ClassName Win32_Volume | 
    Select-Object DriveLetter, Label, SerialNumber, @{n = 'FreeSpace'; E = {"{0:N2}" -f ($_.FreeSpace / 1GB)}},
@{n = 'Capacity'; E = {"{0:N2}" -f ($_.Capacity / 1GB)}}
$ServicesInformation = Get-CimInstance -ClassName Win32_Service | Select-Object Name , State , ExitCode -First 5 
$ProcessInformation = Get-CimInstance -ClassName Win32_Process | Select-Object Name , WorkingSetSize , Handle -First 5
[pscustomobject]@{
    Disk               = $DiskInformation
    Service            = $ServicesInformation
    ProcessInformation = $ProcessInformation
} | ConvertTo-Json -Compress