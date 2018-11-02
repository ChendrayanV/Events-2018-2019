html {
    head {
        Title -Content "Do Skype"
        meta -charset "utf-8"
        meta -name "viewport" -content "width=device-width, initial-scale=1"
        Link -href "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -rel "stylesheet"
        script -src "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"
        script -src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        script -src "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    }
    body {
        div -Class "jumbotron text-center" -Content {
            h1 -Content "iSkype in Office365"
            p -Content "Powered by Polaris and PSHTML"
        }

        div -Class "container" -Content {
            h3 "Call demo"
            ul -Class "list-group" -Content {
                li -Class "list-group-item"  -Content {
                    a -href "skype://jasjith.chopra?call" -Content {
                        [string]::Concat([char](0x260E) , " Jasjith")
                    }
                }
                hr
                li -Class "list-group-item"  -Content {
                    a -href "skype://chendrayan.venkatesan?call" -Content {
                        [string]::Concat([char](0x260E) , " Chendrayan")
                    }
                }
            }

            hr 
            h3 "Chat Demo"
            ul -Class "list-group" -Content {
                li -Class "list-group-item"  -Content {
                    a -href "skype://jasjith.chopra?chat" -Content {
                        [string]::Concat([char](0x0212D) , " Jasjith")
                    }
                }
                hr
                li -Class "list-group-item"  -Content {
                    a -href "skype://chendrayan.venkatesan?chat" -Content {
                        [string]::Concat([char](0x0212D) , " Chendrayan")
                    }
                }
            }

            hr 
            h3 "User Information"
            ul -Class "list-group" -Content {
                li -Class "list-group-item"  -Content {
                    a -href "skype://jasjith.chopra?userinfo" -Content {
                        [string]::Concat([char](0x0270D) , " Jasjith")
                    }
                }
                hr
                li -Class "list-group-item"  -Content {
                    a -href "skype://chendrayan.venkatesan?userinfo" -Content {
                        [string]::Concat([char](0x0270D) , " Chendrayan")
                    }
                }
            }
        }
    }
}