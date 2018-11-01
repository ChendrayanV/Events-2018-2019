New-PolarisGetRoute -Path "/spListInformation" -Scriptblock {
    $HTML = .\scripts\spListInformation.ps1
    $Response.SetContentType('text/html')
    $Response.Send($HTML)
}