New-PolarisGetRoute -Path "/home" -Scriptblock {
    $HTML = .\scripts\home.ps1
    $Response.SetContentType('text/html')
    $Response.Send($HTML)
}