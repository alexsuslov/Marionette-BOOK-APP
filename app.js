/**
 * Marionette BOOK APP
 * @create 2015-03-11
 */
"use strict"
require('coffee-script/register');

var express   = require('express'),
  config    = require('./config'),
  glob      = require('glob'),
  timeOut   = 1000 * 60 * 5,
  mongoose  = require('mongoose');

/***************************************************************************
 *
 *   mongo connect
 *
 ***************************************************************************/
mongoose.connect(config.db);
var db = mongoose.connection;
db.on('error', function () {
  console.log(new Error('unable to connect to database at ' + config.db));
});

/***************************************************************************
 *
 *   Connect mongo models
 *
 ***************************************************************************/
var models = glob.sync(config.root + '/app/models/*.coffee');
models.forEach(function (model) {
  try {
    require(model);
  } catch (e) {
    console.log('mongo model error:', model, e);
  }
});

/***************************************************************************
 *
 *   Passport
 *
 ***************************************************************************/
require('./config/passport')();

var app = express();
/***************************************************************************
 *
 *   express Configuration
 *
 ***************************************************************************/
require('./config/express')(app, config);
app.listen(config.port, config.host);
console.log('App listen ', 'http://' + config.host + ':' + config.port);
