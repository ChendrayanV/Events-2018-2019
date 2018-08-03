$adsi = New-Object adsisearcher
$adsi.Filter = "(&(ObjectCategory=User)(sAMAccountName=$env:USERNAME))"
$propertiestoLoad = @('givenname' , 'sn')
$adsi.PropertiesToLoad.AddRange($propertiestoLoad)
[pscustomobject]@{
    GivenName = $adsi.FindOne().Properties['givenname'] -as [string]
    SurName   = $adsi.FindOne().Properties['sn'] -as [string]
} | ConvertTo-Json