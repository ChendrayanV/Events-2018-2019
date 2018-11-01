New-PolarisGetRoute -Path "/spFeedbackDashboard" -Scriptblock {
    $Response.SetContentType('text/html')
    $Html = .\scripts\spFeedbackDashboard.ps1
    $Response.Send($Html)
}