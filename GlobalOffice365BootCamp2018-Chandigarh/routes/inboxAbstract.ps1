New-PolarisGetRoute -Path "/inboxAbstract" -Scriptblock {
    $HTML = .\scripts\inboxAbstract.ps1
    $Response.SetContentType('text/html')
    $Response.Send($HTML)
}