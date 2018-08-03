var express = require('express')
var app = express();
var path = require('path');
var bodyparser = require('body-parser');
var spawn = require('child_process').spawn, child;

// SET VIEWS
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');
app.use(bodyparser.urlencoded({ extended: true }));

//Routes for Web Application
var index = require('./routes/index');
var employeeSearch = require('./routes/employeeSearch')
var employeeRecord = require('./routes/employeeRecord')
var insertRecord = require('./routes/insertRecord')
var InsertEmployeeRecord = require('./routes/insertEmployeeRecord')
//Routes for RESTful API
var employeeRecord_api = require('./routes/employeeRecord-api')

// GET
app.use('/', index);
app.use('/employeeSearch', employeeSearch)
app.use('/insertRecord', insertRecord)

// POST
app.post('/employeeRecord', employeeRecord)
app.post('/employeeRecord-api', employeeRecord_api)
app.post('/InsertEmployeeRecord', InsertEmployeeRecord)



app.listen(3000)
console.log("Your application is running on port 3000")

