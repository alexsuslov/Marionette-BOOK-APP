###*
 * Auto Stock
 * Car model
 * @create 2015-05-13
###
'use strict'

mongoose = require("mongoose")
Schema = mongoose.Schema
ObjectId = Schema.Types.ObjectId

Model = mongoose.model "car", new Schema
  id            : Number
  name          : String
  modification  : String
  mark          : String
  type          : String
  years         : String
  brand         : Object
  seria         : Object
  # system
  owner   : ObjectId
  create  :
    type    : Number
    default : -> Math.floor(Date.now() / 1000)


module.exports = Model
