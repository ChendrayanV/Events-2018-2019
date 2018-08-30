'use strict';
var express = require('express');
var router = express.Router();
var bodyparser = require('body-parser');
var shell = require('node-powershell');
var ps = new shell({
    executionPolicy: 'bypass',
    noProfile: true
})
//app.use(bodyparser.urlencoded({ extended: true }));
router.use(bodyparser.urlencoded({ extended: true }));

router.post('/createList', function (request, response) {
    ps.addCommand("./scripts/NewList.ps1", [ {
        name: 'CallerId',
        value: request.body.rName
    }, {
        name: 'ListName',
        value: request.body.lName
    }, {
        name: 'ListTemplateType',
        value: request.body.listTemplateType
    } ])
    ps.invoke().then(output => {
        response.send(output)
    })
})

module.exports = router;