'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

router.get('/', function (request, response) {
    //response.render('systeminformation')
    child = spawn('powershell.exe',
        [ "C:\\Projects\\Events-2018-2019\\SPSEvents-SEP2018\\scripts\\SystemInformation.ps1" ])
    child.stdout.on('data', function (data) {
        var result = JSON.parse(data)
        response.render('systeminformation', {
            BIOSVersion: result[ 'BIOSVersion' ],
            BIOSManufacturer: result[ 'BIOSManufacturer' ],
            TimeZone: result[ 'TimeZone' ],
            StandardName: result[ 'StandardName' ],
            OSCaption: result[ 'OSCaption' ]
        })
    })
    child.stdout.on('end', function (end) {
        console.log("You are so awesome!")
    })
});

module.exports = router;