New-PolarisGetRoute -Path "/WelcomeDeck" -Scriptblock {
    $Response.SetContentType('text/html')
    [string]$Html = Get-Content "C:\projects\Events-2018-2019\SPSEvents-SEP2018\app.html"
    $Response.Send($Html)
}

Start-Polaris