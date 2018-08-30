var express = require('express');
var app = express();
var path = require('path');
var bodyparser = require('body-parser');
var spawn = require('child_process').spawn, child;

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');
app.use(bodyparser.urlencoded({ extended: true }));

var index = require('./routes/index');
var resume = require('./routes/resume');
var getservice = require('./routes/getservice');
var systeminformation = require('./routes/systeminformation')
var newList = require('./routes/newList')
var createList = require('./routes/createList')

app.use('/', index);
app.use('/resume', resume);
app.use('/getservice', getservice)
app.use('/systeminformation', systeminformation)
app.use('/newList', newList);
app.post('/createList', createList)

app.listen(3000);
console.log("Your Application is running on port 3000");