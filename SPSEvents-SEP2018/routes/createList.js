'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;
var bodyparser = require('body-parser');

//app.use(bodyparser.urlencoded({ extended: true }));
router.use(bodyparser.urlencoded({ extended: true }));
router.post('/createList', function (request, response) {
    child = spawn('powershell.exe',
        [ "C:\\Projects\\Events-2018-2019\\SPSEvents-SEP2018\\scripts\\NewList.ps1 -Caller_id "
            + request.body.rName + " -ListName " + request.body.lName + " -ListTemplateType " + request.body.listTemplateType ])
    child.stdout.pipe(response)
});

module.exports = router;