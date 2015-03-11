###*
 * Marionette BOOK APP
 * root controller
 * @create 2015-03-11
###
'use strict'
express   = require 'express'
router    = express.Router()



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
