'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

router.get('/', function (request, response) {
    child = spawn('powershell.exe',
        ["C:\\Projects\\Events-2018-2019\\SPSEvents-SEP2018\\scripts\\GetSPOUserProfileInformation.ps1"]);
    child.stdout.on('data', function (data) {
        var result = JSON.parse(data.toString())
        response.render('resume', {
            spoProfileInformation: result
        })
    })
    child.stdout.on('error', function (error) {
        console.log(error.message);
    })

});

module.exports = router;