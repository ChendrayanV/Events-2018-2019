New-PolarisGetRoute -Path "/newListCreation" -Scriptblock {
    $Response.SetContentType('text/html')
    $Html = .\scripts\newListCreation.ps1
    $Response.Send($Html)
}