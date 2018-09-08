var express = require('express');
var app = express();

app.get('/' , function(request,response){
    response.send('<b>Chen V</b>')
})
app.post('/servicenow/vsts', function (request, response) {
    spawn('powershell.exe', [ 'C:\\projects\\Events-2018-2019\\DevOps-SEP2018\\scripts\\New-VSTSWorkItem.ps1' ]);
})

app.listen(80)
console.log('Your Application is running on port 80')