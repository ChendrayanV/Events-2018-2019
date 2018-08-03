'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

router.post('/employeeRecord', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\contoso\\scripts\\employeeRecordByID.ps1 -employeeNumber " +
            request.body.employeeNumber ])
    child.stdout.on('data', function (data) {
        var result = JSON.parse(data)
        //response.send(result)
        response.render('employeeRecord', {
            employee_number: result[ 'employee_number' ],
            firstname: result[ 'firstname' ],
            lastname: result[ 'lastname' ],
            displayname: result[ 'displayname' ],
            email: result[ 'email' ]
        })
    })
})

module.exports = router;
