###*
 * Auto Stock
 * Controller for #{pagename}.html
 * @create 2015-03-11
###
'use strict'
express   = require 'express'
router    = express.Router()


router.param 'pagename', (req, res, next, pagename)->
  req.pagename = pagename
  next()


###*
 * Index route
 * @param  {Object}   req  express
 * @param  {Object}   res  express
 * @param  {Function} next callback
 * @return void
###
router.get '/:pagename.html', (req, res, next) ->
  try
    res.render req.pagename
  catch e
    console.log e
    next e

module.exports = (app) ->
  app.use '/', router
