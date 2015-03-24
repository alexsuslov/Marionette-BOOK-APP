###*
 * Marionette BOOK APP
 * Thing model
 * @create 2015-03-11
###
'use strict'

mongoose = require("mongoose")
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Model = mongoose.model "thing", new Schema
  name    : String
  # system
  owner   : ObjectId
  create  :
    type    : Number
    default : -> Math.floor(Date.now() / 1000)


module.exports = Model
