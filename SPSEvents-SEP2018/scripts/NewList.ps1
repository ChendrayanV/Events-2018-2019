param(
    [string]
    $Caller_id =  "Chendrayan Venkatesan",

    [ValidateSet('GenericList' , 'Announcements')]
    $ListTemplateType
)
$config = [xml](Get-Content .\config\config.xml)
$admin = $config.config.snow.userName
$password = $config.config.snow.password | ConvertTo-SecureString -AsPlainText -Force 
$Credential = New-Object pscredential -ArgumentList ($admin, $password)
$Uri = "https://dev42835.service-now.com/api/now/table/incident?sysparm_fields=number,state"
$Body = @{
    category            = "Software"
    "caller_id"         = $Caller_id
    "contact_type"      = "Self-service"
    impact              = "3 - Low"
    urgency             = "3 - Low"
    "short_description" = "Incident Record for Creating SharePoint List"
    description         = "Incident Record for Creating SharePoint List - Requested By Chendrayan Venkatesan"
    "assignment_group"  = "CAB Approval"
    "assigned_to"       = "Chendrayan Venkatesan"
} | ConvertTo-Json
$IncidentResult = Invoke-RestMethod -Uri $Uri -Method Post -Body $Body -Credential $Credential -ContentType "application/json"
<#[pscustomobject]@{
    Incident_Number = $IncidentResult.result.number
    State           = $IncidentResult.result.state 
}#>

Start-Sleep -Seconds 10 

Import-Module 'C:\Projects\Events-2018-2019\SPSEvents-SEP2018\assemblies\Microsoft.SharePoint.Client.dll'
$userName = $config.config.sharepoint.userName
$adminPassword = $config.config.sharepoint.password | ConvertTo-SecureString -AsPlainText -Force
$spoCredential = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new($userName, $adminPassword)
$spoClientContext = [Microsoft.SharePoint.Client.ClientContext]::new("https://chensoffice365.sharepoint.com")
$spoClientContext.Credentials = $spoCredential
$Web = $spoClientContext.Web
$spoClientContext.Load($Web)
$spoClientContext.ExecuteQuery()
$ListCreationInformation = [Microsoft.SharePoint.Client.ListCreationInformation]::new()
$ListCreationInformation.Title = "SPS-Events"
$ListCreationInformation.TemplateType = $ListTemplateType
$Web.Lists.Add($ListCreationInformation)
$spoClientContext.ExecuteQuery()
$spoClientContext.Dispose()

Start-Sleep 45

