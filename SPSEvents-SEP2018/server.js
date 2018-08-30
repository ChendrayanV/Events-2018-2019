var express = require('express');
var app = express();
var path = require('path');
var bodyparser = require('body-parser');
var spawn = require('child_process').spawn, child;

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');
app.use(bodyparser.urlencoded({ extended: true }));

var index = require('./routes/index');
var resume = require('./routes/resume');
var getservice = require('./routes/getservice');
var systeminformation = require('./routes/systeminformation')
var newList = require('./routes/newList')

app.use('/', index);
app.use('/resume', resume);
app.use('/getservice', getservice)
app.use('/systeminformation', systeminformation)
app.use('/newList', newList);

// In-Line Route!
app.post('/createList', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\Events-2018-2019\\SPSEvents-SEP2018\\scripts\\NewList.ps1 -Caller_id "
            + request.body.rName + " -ListName " + request.body.lName + " -ListTemplateType " + request.body.listTemplateType ])
    //child.stdout.pipe(response)
    //console.log(response);
    child.stdout.on('data', function (data) {
        var result = data.toString();
        response.send(result)
    })
});
app.listen(3000);
console.log("Your Application is running on port 3000");