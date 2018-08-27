Get-Process | 
Select-Object Name , DisplayName , Status -First 10 | 
ConvertTo-Json -Compress