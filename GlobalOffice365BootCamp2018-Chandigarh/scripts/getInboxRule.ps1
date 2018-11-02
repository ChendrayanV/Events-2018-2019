Import-Module .\assemblies\Microsoft.Exchange.WebServices.dll
$ExchangeService = [Microsoft.Exchange.WebServices.Data.ExchangeService]::new()
$Cred = "India890*" | ConvertTo-SecureString -AsPlainText -Force
$ExchangeService.Credentials = [System.Net.NetworkCredential]::new("chendrayan@chensoffice365.onmicrosoft.com",$Cred)
$ExchangeService.ImpersonatedUserId = [Microsoft.Exchange.WebServices.Data.ImpersonatedUserId]::new(
[Microsoft.Exchange.WebServices.Data.ConnectingIdType]::SmtpAddress,"chendrayan@chensoffice365.onmicrosoft.com")
$ExchangeService.Url = "https://outlook.office365.com/EWS/Exchange.asmx"
$RuleCollection = $ExchangeService.GetInboxRules()

html {
    head {
        Title -Content "Inbox Rule"
        meta -charset "utf-8"
        meta -name "viewport" -content "width=device-width, initial-scale=1"
        Link -href "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -rel "stylesheet"
        script -src "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
        script -src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        script -src "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    }
    body {
        div -Class "jumbotron text-center" -Content {
            h1 -Content "iExchange in Office365"
            p -Content "Powered by Polaris and PSHTML"
        }
        h3 -Content "Get-xInboxRule" -style "text-align:Center"
        Table -Content {
            th -Content "DisplayName"
            th -Content "Priority"
            th -Content "IsEnabled"
            foreach ($Rule in $RuleCollection) {
                tr -Content {
                    td -Content {
                        $Rule.DisplayName
                    }
                    td -Content {
                        $Rule.Priority
                    }
                    td -Content {
                        $Rule.IsEnabled
                    }
                }
            }
        } -Attributes @{"class" = "table table-striped"}
    } -Attributes @{"lang" = "en"}
} 