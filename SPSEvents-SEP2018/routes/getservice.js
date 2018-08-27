'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

router.get('/', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\Events-2018-2019\\SPSEvents-SEP2018\\scripts\\GetService.ps1" ]);
    child.stdout.on('data', function (data) {
        var result = JSON.parse(data.toString())
        response.render('getservice', {
            serviceResult: result
        })
    })
});

module.exports = router;