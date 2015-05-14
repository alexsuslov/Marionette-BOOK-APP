###*
 * Auto Stock
 * Autoru car import
 * @create 2015-05-13
###
'use strict'

fs      = require('fs')
xml2js  = require('xml2js')
async  = require('async')
parser  = new xml2js.Parser()
config    = require('../config')
mongoose  = require('mongoose')

# mongo
mongoose.connect(config.db)
db = mongoose.connection
Car = require('../app/models/car')

# parse
# http://office7.auto.ru/products/all/sales/upload/cars/help/
fs.readFile __dirname + '/autoru_cars_catalog.xml', (err, data)->
  if err
    throw err
  else
    parser.parseString data, (err, result)->
      throw err if err
      catalog = result.catalog
      brands = catalog.mark
      async.eachSeries brands
      , (brand, callback)->
        Brand =
          id    : brand['$'].id
          name  : brand['$'].name

        series = brand.folder

        async.eachSeries series
        , (seria, cb)->
          Seria =
            id    : seria['$'].id
            name  : seria['$'].name
          modifications = seria.modification
          async.eachSeries modifications
          , (modification, done)->
            NewCar =
              seria : Seria
              brand : Brand
              id    : modification['$'].id
              name  : modification['$'].name
              type  : modification.body_type || '-'
              years : modification.years
            car = new Car NewCar
            car.save ->
              done()
          , ->
            cb()

        , (err)->
          callback()
      , (err)->
          console.log('Done')
          db.close()



