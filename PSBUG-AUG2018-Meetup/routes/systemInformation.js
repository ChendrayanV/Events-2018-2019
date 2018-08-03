'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;
/* Employee Search Page */
router.get('/', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\Events-2018-2019\\PSBUG-AUG2018-Meetup\\scripts\\getSystemInformation.ps1" ])
    child.stdout.on("data", function (data) {
        var sysInfo = JSON.parse(data)
        response.render('systemInformation',{
            results: sysInfo
        })
    })
});

module.exports = router;
