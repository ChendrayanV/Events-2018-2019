Import-Module .\assemblies\Microsoft.SharePoint.Client.dll
Import-Module .\assemblies\Microsoft.SharePoint.Client.Runtime.dll

$SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new("https://chensoffice365.sharepoint.com/")
$Config = [xml](Get-Content .\config\config.xml)
$SPOClientContext.Credentials = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new(
    $Config.configuration.username , 
    ($Config.configuration.password | ConvertTo-SecureString -AsPlainText -Force)
)
$ListCollection = $SPOClientContext.Web.Lists
$SPOClientContext.Load($ListCollection)
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
        # $ListCollection | Select-Object Title , ItemCount | ConvertTo-Json
        Table -Content {
            th -Content "Title"
            th -Content "Item Count"
            th -Content "Progress Bar"
            th -Content "NoCrawl"
            foreach ($List in $ListCollection | 
                    Where-Object {$_.ItemCount -gt 10} | 
                    Sort-Object -Property ItemCount) {
                tr -Content {
                    td -Content {
                        $List.Title
                    }
                    td -Content {
                        $List.ItemCount
                    }
                    td -Content {
                        div -Class "progress" -Content {
                            Div -Class "progress-bar" -Style ([string]::Concat("Width" , ($List.ItemCount / 1000 * 100).ToString("P"))) -Content {
                                ($List.ItemCount / 1000).ToString("P")
                            }
                        }
                    }
                    td -Content {
                        if ($List.NoCrawl) {
                            "&#x2714;"
                        }
                        else {
                            "&#10008;"
                        }
                    }
                }
            }
        } -Attributes @{"class" = "table table-striped"}
    } -Attributes @{"lang" = "en"}
} 