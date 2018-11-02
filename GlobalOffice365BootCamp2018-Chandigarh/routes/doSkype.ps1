New-PolarisGetRoute -Path "/doSkype" -Scriptblock {
    $HTML = .\scripts\doSkype.ps1
    $Response.SetContentType('text/html')
    $Response.Send($HTML)
}