###*
 * Auto Stock
 * Api controller
 * @create 2015-03-11
###
'use strict'
express   = require 'express'
router    = express.Router()
glob      = require 'glob'
path      = require 'path'


routers = glob.sync __dirname + '/api/*.coffee'
routers.forEach (file)->
  try
    router.use '/' + path.basename( file, '.coffee'), require file
  catch e
    console.log 'Api error:', file, e

module.exports = (app)->
  app.use '/api', router
