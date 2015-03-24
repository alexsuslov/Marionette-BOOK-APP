###*
 * Marionette BOOK APP
 * Thing api controller
 * @create 2015-03-11
###
'use strict'

express   = require 'express'
router    = express.Router()
mongoose  = require 'mongoose'
Model     = mongoose.model 'thing'


###*
 * [description]
 * @param  {Object}   req     express
 * @param  {Object}   res     express
 * @param  {Function} next    callback
 * @param  {[type]}   thingID
 * @return void
###
router.param 'thingID', (req, res, next, thingID)->
  try
    Users.findOne _id:thingID
    , (err, thing)->
      throw err if err
      req.thing = thing if thing
      next()
  catch e
    console.log 'Thing api controller error: ', e
    next e


###*
 * [GET] things by query
 * @param  {Object}   req     express
 * @param  {Object}   res     express
 * @param  {Function} next    callback
 * @return void
###
router.get '/', (req, res, next)->
  try

  catch e
    console.log e
    res.status(500).send('Some error.')

module.exports = router
