html {
    head {
        Title -Content "Home"
        Link -href "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -rel "stylesheet"
        script -src "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" -type "text/javascript"
        script -src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" -type "text/javascript"
        script -src "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" -type "text/javascript"
    }
    body {
        div -Class "jumbotron text-center" -Content {
            h1 -Content "iSharePoint in Office365"
            p -Content "Powered by Polaris and PSHTML"
        }
        
        div -Class "Container" -Content {
            div -Class "row" -Content {
                div -Class "col-sm-4" -Content {
                    div -Class "Container" -Content {
                        h3 "Office 365 | Demo" -Style "text-align:Center"
                        ul -Class "list-group list-group-flush" -Content {
                            li -Class "list-group-item" -Content "Web Apps"
                            li -Class "list-group-item" -Content "RESTful API"
                            li -Class "list-group-item" -Content "Dashboards"
                            li -Class "list-group-item list-group-item-success" -Content "Get-Started"
                        }
                    }
                }
                div -Class "col-sm-4" -Content {
                    h3 -Content "PSHTML" -Style "text-align:Center"
                    
                    ul -Class "list-group list-group-flush" -Content {
                        li -Class "list-group-item" -Content "PowerShell like syntax"
                        li -Class "list-group-item" -Content "Cross Platform"
                        li -Class "list-group-item" -Content "Supports Logics"
                        li -Class "list-group-item list-group-item-success" -Content "Install-Module PSHTML -Scope CurrentUser"
                    }
                }
                div -Class "col-sm-4" -Content {
                    h3 -Content "Polaris"
                    ul -Class "list-group list-group-flush" -Content {
                        li -Class "list-group-item" -Content "Minimalist Webframework for PowerShell"
                        li -Class "list-group-item" -Content "Cross Platform"
                        li -Class "list-group-item" -Content ("PSHTML &hearts; PowerShell")
                        li -Class "list-group-item list-group-item-success" -Content "Install-Module Polaris -Scope CurrentUser"
                    }
                }
            }
        }
    }
}