Import-Module .\documentLibrary.psd1 -Verbose
New-PSDrive -Name PSDocLib -PSProvider SHiPS -Root documentLibrary#PSDocLib
CD PSDocLib:
ls | Select Name , TimeCreated