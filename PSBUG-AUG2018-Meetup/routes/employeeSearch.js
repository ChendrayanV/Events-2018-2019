'use strict';
var express = require('express');
var router = express.Router();

/* Employee Search Page */
router.get('/', function (request, response) {
    response.render('employeeSearch')    
});

module.exports = router;
