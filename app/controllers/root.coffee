###*
 * Marionette BOOK APP
 * root controller
 * @create 2015-03-11
###
'use strict'
express   = require 'express'
router    = express.Router()

###*
 * logout
 * @param  {[type]} req express
 * @param  {[type]} res express
 * @return void
###
router.get '/logout', (req, res)->
  req.logout()
  res.clearCookie "user"
  res.redirect('/')


###*
 * User cookie
 * @param  {Object}   req  express
 * @param  {Object}   res  express
 * @param  {Function} next express
 * @return void
###
router.all "/*", (req, res, next)->
  if req.user
    res.cookie "user", JSON.stringify
      displayName: req.user.displayName
      role: req.user.role
  next()



###*
 * Index route
 * @param  {Object}   req  express
 * @param  {Object}   res  express
 * @param  {Function} next callback
 * @return void
###
router.get '/', (req, res, next) ->
  try
    res.render 'index'
  catch e
    console.log e
    next e

module.exports = (app) ->
  app.use '/', router
