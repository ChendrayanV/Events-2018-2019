Import-Module .\assemblies\Microsoft.SharePoint.Client.dll
$userName = ""
$adminPassword = "" | ConvertTo-SecureString -AsPlainText -Force
$spoCredential = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new($userName, $adminPassword)
$spoClientContext = [Microsoft.SharePoint.Client.ClientContext]::new("https://chensoffice365-admin.sharepoint.com")
$spoClientContext.Credentials = $spoCredential