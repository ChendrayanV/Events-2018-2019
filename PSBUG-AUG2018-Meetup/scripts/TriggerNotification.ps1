try {
    $config = Get-Content .\config\config.json | ConvertFrom-Json
    $messageID = "SMc7e3d7abce3b40d294a02aeb8050187b"
    $token = "ee4e25bf98172f046c24ee164f39d51f"
    $p = $token | ConvertTo-SecureString -asPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($messageID, $p)
    Invoke-RestMethod -Uri "https://api.twilio.com/2010-04-01/Accounts/$($config.twilio.ACCOUNT_SID)/$messageID" -Credential $credential 
    
}
catch {
    $_.Exception 
}