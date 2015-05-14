###*
 * Auto Stock
 * express config
 * @create 2015-03-11
###
'use strict'
express         = require 'express'
glob            = require 'glob'
favicon         = require 'serve-favicon'
cookieParser    = require 'cookie-parser'
bodyParser      = require 'body-parser'
compress        = require 'compression'
methodOverride  = require 'method-override'
passport        = require 'passport'
session         = require 'express-session'
mongoStore      = require('connect-mongo')(session)
mongoose        = require 'mongoose'

module.exports = (app, config)->
  # express views
  app.set 'views', config.root + '/app/views'
  app.set 'view engine', 'jade'

  # app.use favicon config.root + '/public/favicon.ico'

  app.use bodyParser.json()
  app.use bodyParser.urlencoded
    extended: true

  # Session
  app.use session
    secret:'App-secret'
    resave: true
    saveUninitialized: true
    store: new mongoStore
      mongooseConnection: mongoose.connection

  # passport
  app.use passport.initialize()
  app.use passport.session()

  app.use compress()
  app.use express.static config.root + '/public'
  app.use methodOverride()

  # @todo: logger
  app.all '*', (req, res, next) ->
    console.log new Date(), req.url
    # console.log 'headers: ',req.headers
    next()

  ###*
   * Controllers
  ###
  controllers = glob.sync config.root + '/app/controllers/*.coffee'
  controllers.forEach (controller) ->
    try
      require(controller)(app)
    catch e
      console.log 'controller error:', controller, e

  # catch 404 and forward to error handler
  app.use (req, res, next) ->
    err = new Error 'Not Found'
    err.status = 404
    next err

  ###*
   * ERROR handlers
  ###
  # development error handler
  # will print stacktrace
  if app.get('env') == 'development'
    app.use (err, req, res, next) ->
      res.status err.status || 500
      res.render 'error',
        message: err.message
        error: err
        title: 'error'

  # production error handler
  # no stacktraces leaked to user
  app.use (err, req, res, next) ->
    res.status err.status || 500
    res.render 'error',
      message: err.message
      error: {}
      title: 'error'
