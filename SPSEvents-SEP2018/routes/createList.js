'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;

router.post('/createList', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\Events-2018-2019\\SPSEvents-SEP2018\\scripts\\NewList.ps1" ])
    child.stdout.on('data' , function(data){
        
    })
});

module.exports = router;