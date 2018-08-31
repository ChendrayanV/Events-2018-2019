Get-Process | 
Select-Object ProcessName , Id , Handles -First 10 | 
ConvertTo-Json -Compress