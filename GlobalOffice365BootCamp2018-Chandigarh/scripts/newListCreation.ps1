html {
    head {
        Title -Content "New List Creation"
        Link -href "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -rel "stylesheet"
        script -src "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" -type "text/javascript"
        script -src "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" -type "text/javascript"
        script -src "https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" -type "text/javascript"
    }

    body {
        div -Class "jumbotron text-center" -Content {
            h1 -Content "New SharePoint List"
            p -Content "Powered by Polaris and PSHTML"
        }

        Div -Class "container" -Content {
            form -Class "form-horizontal" -action "/createList" -method "post" -target "_blank" -Attributes @{'autocomplete'='OFF'} -Content {
                Div -Class "form-group" -Content {
                    label -Class "control-label col-sm-2" -Attributes @{'for' = 'title'} -Content "Title:"
                    Div -Class "col-sm-10" -Content {
                        input -type "text" -Class "form-control" -id "title" -name "title"
                    }
                }

                Div -Class "form-group" -Content {
                    label -Class "control-label col-sm-2" -Attributes @{'for' = 'description'} -Content "Description:"
                    Div -Class "col-sm-10" -Content {
                        input -type "text" -Class "form-control" -id "description" -name "Description"
                    }
                }

                Div -Class "form-group" -Content {
                    Div -Class "col-sm-10" -Content {
                        Div -Class "checkbox" -Content {
                            label -Content {
                                input -type "checkbox" -name "Crawl"
                                "Enable Crawl"
                            }
                        }
                    }
                }

                Div -Class "form-group" -Content {
                    Div -Class "col-sm-10" -Content {
                        Div -Class "checkbox" -Content {
                            label -Content {
                                input -type "checkbox" -name "Attachment"
                                "Disable Attachment"
                            }
                        }
                    }
                }

                Div -Class "form-group" -Content {
                    Div -Class "col-sm-10" -Content {
                        Div -Class "checkbox" -Content {
                            label -Content {
                                input -type "checkbox" -name "FieldCompliance"
                                "Enable Field Compliance"
                            }
                        }
                    }
                }

                Div -Class "form-group" -Content {
                    Div -Class "col-sm-offset-2 col-sm-10" -Content {
                        button -Content "Submit" -Class "btn btn-default" -Attributes @{"type" = "submit"}
                    }
                }
            }
        }
    }
}