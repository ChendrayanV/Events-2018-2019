$admin = ""
$password = "" | ConvertTo-SecureString -AsPlainText -Force 
$Credential = New-Object pscredential -ArgumentList ($admin, $password)
$Uri = "https://dev42835.service-now.com/api/now/table/incident?sysparm_fields=number,state"
$Body = @{
    category            = "Software"
    "caller_id"         = "Chendrayan Venkatesan"
    "contact_type"      = "Self-service"
    impact              = "3 - Low"
    urgency             = "3 - Low"
    "short_description" = "Incident Record for Creating SharePoint List"
    description         = "Incident Record for Creating SharePoint List - Requested By Chendrayan Venkatesan"
    "assignment_group"  = "CAB Approval"
    "assigned_to"       = "Chendrayan Venkatesan"
} | ConvertTo-Json
$IncidentResult = Invoke-RestMethod -Uri $Uri -Method Post -Body $Body -Credential $Credential -ContentType "application/json"
[pscustomobject]@{
    Incident_Number = $IncidentResult.result.number
    State           = $IncidentResult.result.state 
}

Start-Sleep -Seconds 10 

