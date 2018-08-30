using namespace Microsoft.PowerShell.SHiPS

[SHiPSProvider()]
class PSDocLib : SHiPSDirectory {
    PSDocLib([string]$name): base($name) {

    }
    [object[]] GetChildItem() {
        $obj = @()
        $docInformation = Get-SPDocLibItem
        $obj += $docInformation
        return $obj
    }

}

function Get-SPDocLibItem
{
    Import-Module 'C:\Projects\Events-2018-2019\SPSEvents-SEP2018\assemblies\Microsoft.SharePoint.Client.dll'
    Import-Module 'C:\Projects\Events-2018-2019\SPSEvents-SEP2018\assemblies\Microsoft.SharePoint.Client.Runtime.dll'
    $config = [xml](Get-Content 'C:\Projects\Events-2018-2019\SPSEvents-SEP2018\config\config.xml')
    $userName = $config.config.sharepoint.userName
    $passWord = $config.config.sharepoint.password | ConvertTo-SecureString -AsPlainText -Force
    $spoClientContext = [Microsoft.SharePoint.Client.ClientContext]::new('https://chensoffice365.sharepoint.com')
    $spoClientContext.Credentials = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new($userName, $passWord)
    $DocLib = $spoClientContext.Web.Lists.GetByTitle('MyDocLibrary')
    $spoClientContext.Load($DocLib)
    $ListItemCollection = $DocLib.GetItems([Microsoft.SharePoint.Client.CamlQuery]::CreateAllItemsQuery())
    $spoClientContext.Load($ListItemCollection)
    $spoClientContext.ExecuteQuery()
    foreach($ListItem in $ListItemCollection) {
        $file = $spoClientContext.Web.GetFileByServerRelativeUrl($ListItem["FileRef"])
        $Author = $file.Author
        $spoClientContext.Load($file)
        $spoClientContext.Load($file.ListItemAllFields)
        $spoClientContext.Load($Author)
        $spoClientContext.ExecuteQuery()
        $spoClientContext.Dispose()
        [pscustomobject]@{
            Name = $file.Name
            TimeCreated = $file.TimeCreated
            MajorVersion = $file.MajorVersion
            MinorVersion = $file.MinorVersion
            AuthorEmail = $file.Author.Email

        }
    }
}