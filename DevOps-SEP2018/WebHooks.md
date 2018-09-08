# Summary

In short, we will create a VSTS tasks when a GIT commit event is fired! This is a request from the audience.

Step 1: Install Node on Windows

Step 2: Create a web server using express framework.

```PowerShell
PS C:\> npm install express
```

Step 3: Create a route with POST method and play with your needs.

```javascript
app.post('/servicenow/vsts', function (request, response) {
    spawn('powershell.exe', [ 'C:\\projects\\Events-2018-2019\\DevOps-SEP2018\\scripts\\New-VSTSWorkItem.ps1' ]);
})
```

Step 4: Add the route URL in service hooks wizard.

![Image1](https://github.com/ChendrayanV/Events-2018-2019/blob/master/DevOps-SEP2018/images/S1.png)

![Image2](https://github.com/ChendrayanV/Events-2018-2019/blob/master/DevOps-SEP2018/images/S2.png)

![Image3](https://github.com/ChendrayanV/Events-2018-2019/blob/master/DevOps-SEP2018/images/S3.png)

![Image4](https://github.com/ChendrayanV/Events-2018-2019/blob/master/DevOps-SEP2018/images/S4.png)

![Image5](https://github.com/ChendrayanV/Events-2018-2019/blob/master/DevOps-SEP2018/images/S5.png)

![Image6](https://github.com/ChendrayanV/Events-2018-2019/blob/master/DevOps-SEP2018/images/S6.png)

Step 5: Push the code from client machine which fires the event and calls PowerShell script to create a VSTS work item.

Step 6: PowerShell Create VSTS Work Item

```PowerShell
# PLEASE DO NOT USE CLEAR TEXT PASSWORD - THIS IS A DEMO CODE USED IN HANDS ON TRAINING
$configuration = [xml](Get-Content .\config\config.xml)
# Live ID User Name
$userName = $configuration.configuration.userName
# Live ID Password
$password = $configuration.configuration.password | ConvertTo-SecureString -AsPlainText -Force
$credential = New-Object pscredential -ArgumentList ($userName,$password)
$RestParams = @{
    Uri         = "https://$($configuration.configuration.instancename).visualstudio.com/servicenow/_apis/wit/workitems/`$task?api-version=1.0"   
    ContentType = 'application/json-patch+json'
    Method      = "Patch"
    Credential  = $credential
    Body        = @(
        @{
            op    = "add"
            path  = "/fields/System.Title"
            value = "A Code Push Occurred and respective task has been created!"
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
```

Step 7: Start your node server

```javascript
PS C:\> node .\server.js
```