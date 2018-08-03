'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

router.post('/InsertEmployeeRecord', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\contoso\\scripts\\insertEmployeeRecord.ps1 -employeeNumber " + request.body.employeeNumber +
            " -firstname " + request.body.firstname +
            " -lastname " + request.body.lastname +
            " -displayname " + request.body.displayname +
            " -email " + request.body.email +
            " -country " + request.body.country +
            " -mobile " + request.body.mobile ])
    child.stdout.on('data', function (data) {
        var result = {
            employee_number: request.body.employeeNumber,
            firstname: request.body.firstname,
            lastname: request.body.lastname,
            email: request.body.email,
            country: request.body.country,
            mobile: request.body.mobile
        }
        response.send(result)
    })
})

module.exports = router;
