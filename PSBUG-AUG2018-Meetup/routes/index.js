'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

/* GET logged on user information. */
router.get('/', function (request, response) {
    /*child = spawn('powershell.exe',
        [ "C:\\Projects\\contoso\\scripts\\LoggedOnUserInformation.ps1" ])
    child.stdout.on('data', function (data) {
        var result = JSON.parse(data.toString())
        response.render('index', {
            User: result[ 'GivenName' ] + " " + result[ 'SurName' ]
        })
    })*/
    response.render('index')
});

module.exports = router;
