###*
 * Auto Stock
 * Car api controller
 * @create 2015-05-13
###
'use strict'

express   = require 'express'
router    = express.Router()
mongoose  = require 'mongoose'
Query     = require 'wc-query'
Model     = mongoose.model 'car'


###*
 * [description]
 * @param  {Object}   req     express
 * @param  {Object}   res     express
 * @param  {Function} next    callback
 * @param  {[type]}   thingID
 * @return void
###
router.param 'carID', (req, res, next, carID)->
  try
    Model.findOne _id:carID
    , (err, car)->
      throw err if err
      req.car = car if car
      next()
  catch e
    console.log 'Thing api controller error: ', e
    next e


###*
 * [GET] cars by query
 * @param  {Object}   req     express
 * @param  {Object}   res     express
 * @param  {Function} next    callback
 * @return void
###
router.get '/', (req, res, next)->
  try
    query = Query(req.query)
    Model.find query.conditions, null, query.options, (err, cars)->
      res.status(200).json cars

  catch e
    console.log e
    res.status(500).send('Some error.')

module.exports = router
