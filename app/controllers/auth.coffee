###*
 * Marionette BOOK APP
 * Auth controller
 * @create 2015-03-11
###
'use strict'
express   = require 'express'
router    = express.Router()
glob      = require 'glob'
path      = require 'path'


controllers = glob.sync __dirname + '/auth/*.coffee'

controllers.forEach (controller) ->
  try
    router.use '/' + path.basename( controller, '.coffee'), require controller
  catch e
    console.log 'controller error:', controller, e

module.exports = (app)->
  app.use '/auth', router
