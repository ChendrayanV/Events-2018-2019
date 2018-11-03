Import-Module .\assemblies\Microsoft.Exchange.WebServices.dll
$ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
$Config = [xml](Get-Content .\config\config.xml)
$ExchangeService.Credentials = [System.Net.NetworkCredential]::new(
    $Config.configuration.username, ($Config.configuration.password | ConvertTo-SecureString -AsPlainText -Force)
)
$ExchangeService.ImpersonatedUserId = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::new(
    [Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress, "chendrayan@chensoffice365.onmicrosoft.com")
$ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
$ItemCollection = $ExchangeService.FindItems(
    [Microsoft.Exchange.WebServices.Data.WellKnownFolderName]::Inbox,
    [Microsoft.Exchange.WebServices.Data.ItemView]::new(20)
)

html {
    head {
        Title -Content "Inbox Rule"
        meta -charset "utf-8"
        meta -name "viewport" -content "width=device-width, initial-scale=1"
        Link -href "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -rel "stylesheet"
        script -src "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
        script -src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        script -src "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
        $r = " 
        .dotGreen {
            height: 15px;
            width: 15px;
            background-color: Green;
            border-radius: 50%;
            display: inline-block;
        }
        .dotBlue {
            height: 15px;
            width: 15px;
            background-color: Blue;
            border-radius: 50%;
            display: inline-block;
        }
        .dotOrange {
            height: 15px;
            width: 15px;
            background-color: Orange;
            border-radius: 50%;
            display: inline-block;
        }
        .dotRED {
            height: 15px;
            width: 15px;
            background-color: RED;
            border-radius: 50%;
            display: inline-block;
        }
        "
        style -Content {
            $r 
        }
    }
    body {
        div -Class "jumbotron text-center" -Content {
            h1 -Content "iExchange in Office365"
            p -Content "Powered by Polaris and PSHTML"
        }
        h3 -Content "Get-xInboxAbstract" -style "text-align:Center"
        Table -Content {
            th -Content "Sender"
            th -Content "Importance"
            th -Content "IsRead"
            th -Content "Visuals"
            th -Content "Category"
            foreach ($Item in $ItemCollection) {
                tr -Content {
                    td -Content {
                        $Item.Sender
                    }
                    td -Content {
                        $Item.Importance
                    }
                    td -Content {
                        $Item.IsRead
                    }
                    td -Content {
                        if ($Item.IsRead) {
                            [char]0x2764
                        }
                        else {
                            [char](0x2709)
                        }
                    }
                    td -Content {
                        if ($Item.Categories -as [string] -like "Green*") {
                            h3 -class "dotGreen"
                        }
                        if ($Item.Categories -as [string] -like "Blue*") {
                            h3 -class "dotBlue"
                        }
                        if ($Item.Categories -as [string] -like "Orange*") {
                            h3 -class "dotOrange"
                        }
                        if ($Item.Categories -as [string] -like "Red*") {
                            h3 -class "dotRED"
                        }
                    }
                }
            }
        } -Attributes @{"class" = "table table-striped"}
    } -Attributes @{"lang" = "en"}
} 