Import-Module .\assemblies\Microsoft.SharePoint.Client.dll
Import-Module .\assemblies\Microsoft.SharePoint.Client.Runtime.dll

$SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new("https://chensoffice365.sharepoint.com/")
$Config = [xml](Get-Content .\config\config.xml)
$SPOClientContext.Credentials = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new($Config.configuration.username,
($Config.configuration.password | ConvertTo-SecureString -AsPlainText -Force))
$List = $SPOClientContext.Web.Lists.GetByTitle('Feedback')
# $SPOClientContext.Load($List)
# $SPOClientContext.ExecuteQuery()
$ListItemCollection = $List.GetItems([Microsoft.SharePoint.Client.CamlQuery]::CreateAllItemsQuery())
$SPOClientContext.Load($ListItemCollection)
$SPOClientContext.ExecuteQuery()
$SPOClientContext.Dispose()

html {
    head {
        Title -Content "SharePoint List"
        meta -charset "utf-8"
        meta -name "viewport" -content "width=device-width, initial-scale=1"
        Link -href "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -rel "stylesheet"
        script -src "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
        script -src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        script -src "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    }
    body {
        Table -Content {
            th -Content "Title"
            th -Content "Score"
            th -Content "Visuals"
            foreach ($ListItem in $ListItemCollection) {
                tr -Content {
                    td -Content {
                        $ListItem.Item('Title')
                    }
                    td -Content {
                        $ListItem.Item('Score')
                    }
                    td -Content {
                        [string]::new([char]0x2764,$ListItem.Item('Score'))
                    }
                }
            }
        } -Attributes @{"class" = "table table-striped"}
    } -Attributes @{"lang" = "en"}
} 