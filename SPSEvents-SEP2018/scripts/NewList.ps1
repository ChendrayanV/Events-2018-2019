param(
    [string]
    $Callerid,

    [string]
    $ListName,

    [Microsoft.SharePoint.Client.ListTemplateType]
    [ValidateSet('GenericList' , 'Announcements')]
    $ListTemplateType
)
$config = [xml](Get-Content .\config\config.xml)
$admin = $config.config.snow.userName
$password = $config.config.snow.password | ConvertTo-SecureString -AsPlainText -Force 
$Credential = New-Object pscredential -ArgumentList ($admin, $password)
$Uri = "https://dev42835.service-now.com/api/now/table/incident?sysparm_fields=number,state,sys_id"
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
# Start-Sleep -Seconds 10 
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
$ListCreationInformation.Title = $ListName
$ListCreationInformation.TemplateType = $ListTemplateType
$Listc = $Web.Lists.Add($ListCreationInformation)
$spoClientContext.ExecuteQuery()
$spoClientContext.Dispose()
# Start-Sleep 15
$List = $spoClientContext.Web.Lists.GetByTitle($ListName)
$spoClientContext.Load($List)
$spoClientContext.ExecuteQuery()
$spoClientContext.Dispose()
$Uri = "https://dev42835.service-now.com/api/now/table/incident/$($IncidentResult.result.sys_id)?sysparm_display_value=true&sysparm_fields=number,state,incident_state,sys_id"
$Body = @{
    work_notes = @{
        ListName = $List.Title
        Created  = $List.Created
        Notes    = "Auto Closing the INC as per the requirement"
        Contact  = "chen@contoso.com"
    }
    state      = "Resolved"
} | ConvertTo-Json
$IncidentInformation = Invoke-RestMethod -Uri $Uri -Method Patch -Body $Body -Credential $Credential
[pscustomobject]@{
    Incident_Number = $IncidentInformation.result.Number
    Incident_State  = $IncidentInformation.result.state
    Incident_Sys_Id = $IncidentInformation.result.sys_id
    ListName        = $List.Title
    Created         = $List.Created
} | ConvertTo-Json -Compress