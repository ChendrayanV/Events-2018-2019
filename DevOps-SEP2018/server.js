var express = require('express');
var app = express();

app.post('/servicenow/vsts', function (request, response) {
    spawn('powershell.exe', [ 'C:\\projects\\Events-2018-2019\\DevOps-SEP2018\\scripts\\New-VSTSWorkItem.ps1' ]);
})

app.listen(3000)
console.log('Your Application is running on port 3000')