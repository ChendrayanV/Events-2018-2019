Import-Module .\assemblies\Microsoft.SharePoint.Client.dll
Import-Module .\assemblies\Microsoft.SharePoint.Client.UserProfiles.dll
$userName = "chendrayan@chensoffice365.onmicrosoft.com"
$adminPassword = "India890*" | ConvertTo-SecureString -AsPlainText -Force
$spoCredential = [Microsoft.SharePoint.Client.SharePointOnlineCredentials]::new($userName, $adminPassword)
$spoClientContext = [Microsoft.SharePoint.Client.ClientContext]::new("https://chensoffice365-admin.sharepoint.com")
$spoClientContext.Credentials = $spoCredential

$spoUsers = $spoClientContext.Web.SiteUsers
$spoClientContext.Load($spoUsers)
$spoClientContext.ExecuteQuery()

$spoPeopleManager = [Microsoft.SharePoint.Client.UserProfiles.PeopleManager]::new($spoClientContext)
$collection = @()
foreach ($spoUser in $spoUsers) {
    $spoUserProfile = $spoPeopleManager.GetPropertiesFor($spoUser.LoginName)
    $spoClientContext.Load($spoUserProfile)
    $spoClientContext.ExecuteQuery()
    if ($spoUserProfile.Email -ne $null -and $spoUserProfile.UserProfileProperties['FirstName'] -eq 'Chendrayan') {
        $result = [pscustomobject]@{
            FirstName    = $spoUserProfile.UserProfileProperties['FirstName']
            LastName     = $spoUserProfile.UserProfileProperties['LastName']
            DisplayName  = $spoUserProfile.UserProfileProperties['PreferredName']
            WorkPhone    = $spoUserProfile.UserProfileProperties['WorkPhone']
            AboutMe      = $spoUserProfile.UserProfileProperties['AboutMe']
            PictureURL   = $spoUserProfile.UserProfileProperties['PictureURL']
            JobTitle     = $spoUserProfile.UserProfileProperties['SPS-JobTitle']
            Skills       = ($spoUserProfile.UserProfileProperties['SPS-Skills'] -split "\|")
            School       = $spoUserProfile.UserProfileProperties['SPS-School']
            Interests    = ($spoUserProfile.UserProfileProperties['SPS-Interests'] -split "\|")
            WorkEmail    = $spoUserProfile.UserProfileProperties['WorkEmail']
            PastProjects = ($spoUserProfile.UserProfileProperties['SPS-PastProjects'] -split "\|")
        }
        $collection += $result
    }
}
$collection | ConvertTo-Json -Compress