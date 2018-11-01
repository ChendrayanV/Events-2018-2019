Import-Module .\assemblies\Microsoft.SharePoint.Client.dll
Import-Module .\assemblies\Microsoft.SharePoint.Client.Runtime.dll

New-PolarisPostRoute -Path "/createList" -Scriptblock {
    $Response.SetContentType('application/json')
    $Body = [System.Web.HttpUtility]::UrlDecode($Request.BodyString)
    $Data = @{}
    $Body.split('&') | ForEach-Object {
        $part = $_.split('=')
        $Data.add($part[0], $part[1])
    }
    $Result = $Data | ConvertTo-Json | ConvertFrom-Json
    $SPOClientContext = [Microsoft.SharePoint.Client.ClientContext]::new("https://chensoffice365.sharepoint.com/")
    $Securepassword = "India890*" | ConvertTo-SecureString -AsPlainText -Force
    $SPOClientContext.Credentials = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new("chendrayan@chensoffice365.onmicrosoft.com" , $Securepassword)
    $ListCreationInformation = [Microsoft.SharePoint.Client.ListCreationInformation]::new()

    $ListCreationInformation.Title = $Result.title 
    $ListCreationInformation.Description = "Created Using PowerShell CSOM"
    $ListCreationInformation.TemplateType = [int]([Microsoft.SharePoint.Client.ListTemplateType]::GenericList)
    $NewList = $SPOClientContext.Web.Lists.Add($ListCreationInformation)
    if ($Result.Crawl -eq 'on') {
        $NewList.NoCrawl = $true
        $NewList.Update()
    }
    if ($Result.Attachment -eq 'on') {
        $NewList.EnableAttachments = $false
        $NewList.Update()
    }
    if ($Result.FieldCompliance -eq 'on') {
        $NewList.Fields.AddFieldAsXml("<Field DisplayName='Number' Type='Number' />",
            $true,
            [Microsoft.SharePoint.Client.AddFieldOptions]::DefaultValue)
        $NewList.Fields.AddFieldAsXml("<Field DisplayName='Text' Type='Text' />",
            $true,
            [Microsoft.SharePoint.Client.AddFieldOptions]::DefaultValue)
        $NewList.Fields.AddFieldAsXml("<Field DisplayName='DateTime' Type='DateTime' />",
            $true,
            [Microsoft.SharePoint.Client.AddFieldOptions]::DefaultValue)
        $NewList.Update()
    }
    $SPOClientContext.ExecuteQuery()
    $res = [pscustomobject]@{
        ListName       = $NewList.Title
        EnabledCrawled = $NewList.NoCrawl
    } | ConvertTo-Json
    $Response.Send($res)
}