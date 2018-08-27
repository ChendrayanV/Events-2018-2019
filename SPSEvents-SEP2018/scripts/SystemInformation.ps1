$ComputerName = $env:COMPUTERNAME
$ComputerSystem = Get-WmiObject -Class Win32_ComputerSystem |  
    Select-Object -Property Model , Manufacturer , Description , PrimaryOwnerName , SystemType
$BootConfiguration = Get-WmiObject -Class Win32_BootConfiguration | 
    Select-Object -Property Name , ConfigurationPath
$BIOS = Get-WmiObject -Class Win32_BIOS | 
    Select-Object -Property PSComputerName , Manufacturer , Version
$OS = Get-WmiObject -Class Win32_OperatingSystem | 
    Select-Object -Property Caption , OSArchitecture , OSLanguage 
$TimeZone = Get-WmiObject -Class Win32_TimeZone | 
    Select-Object Caption , StandardName
$Disk = Get-WmiObject -Class Win32_LogicalDisk -Filter DriveType=3 |  
    Select-Object SystemName , DeviceID , 
@{Name = "size(GB)"; Expression = {“{0:N1}" -f ($_.size / 1gb)}}, @{Name = "freespace(GB)"; Expression = {“{0:N1}" -f ($_.freespace / 1gb)}}
[pscustomobject]@{
    Model            = $ComputerSystem.Model
    ConfigPath       = $BootConfiguration.ConfigurationPath
    BIOSManufacturer = $BIOS.Manufacturer
    BIOSVersion      = $BIOS.Version
    OSCaption        = $OS.Caption
    OSArchitecture   = $OS.OSArchitecture
    OSLanguage       = $OS.OSLanguage
    TimeZone         = $TimeZone.Caption
    StandardName     = $TimeZone.StandardName
    DeviceID         = $Disk.DeviceID
    Size             = $Disk.'size(GB)' + " GB" 
    FreeSpace        = $Disk.'freespace(GB)' + " GB"
} | ConvertTo-Json -Compress