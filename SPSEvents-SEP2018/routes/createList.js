'use strict';
var express = require('express');
var router = express.Router();
var spawn = require('child_process').spawn, child;
var bodyparser = require('body-parser');

//app.use(bodyparser.urlencoded({ extended: true }));
router.use(bodyparser.urlencoded({ extended: true }));

router.post('/createList', function (request, response) {
    
})

module.exports = router;