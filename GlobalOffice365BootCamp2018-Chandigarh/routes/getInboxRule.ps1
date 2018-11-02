New-PolarisGetRoute -Path "/getInboxRule" -Scriptblock {
    $HTML = .\scripts\getInboxRule.ps1
    $Response.SetContentType('text/html')
    $Response.Send($HTML)
}