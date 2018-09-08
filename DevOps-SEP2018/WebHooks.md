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