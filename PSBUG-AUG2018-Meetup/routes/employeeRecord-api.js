'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

router.post('/employeeRecord-api', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\contoso\\scripts\\employeeRecordByID.ps1 -employeeNumber " +
            request.body.employeeNumber ])
    child.stdout.on('data', function (data) {
        response.send(data)
    })
})

module.exports = router;