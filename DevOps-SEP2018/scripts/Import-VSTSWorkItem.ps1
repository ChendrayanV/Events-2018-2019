# PLEASE DO NOT USE CLEAR TEXT PASSWORD - THIS IS A DEMO CODE USED IN HANDS ON TRAINING
$configuration = [xml](Get-Content .\config\config.xml)
# Live ID User Name
$userName = $configuration.configuration.userName
# Live ID Password
$password = $configuration.configuration.password | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object pscredential -ArgumentList ($userName,$password)
$Values = Import-Csv .\WIT.csv
foreach ($Value in $Values) {
    $RestParams = @{
        Uri         = "https://about-powershell.visualstudio.com/servicenow/_apis/wit/workitems/`$task?api-version=1.0"   
        ContentType = 'application/json-patch+json'
        Method      = "Patch"
        Credential  = $credential
        Body        = @(
            @{
                op    = "add"
                path  = "/fields/System.Title"
                value = $value.value
            }
            @{
                op    = "add"
                path  = "/fields/System.AreaPath"
                value = "servicenow"
            }
            @{
                op    = "add"
                path  = "/fields/System.IterationPath"
                value = "servicenow"
            }
            @{
                op    = "add"
                path  = "/fields/System.AssignedTo"
                value = $value.technician
            }
        ) | ConvertTo-Json
    }
    Invoke-RestMethod @RestParams -Verbose
}