###*
 * Auto Stock
 * user model
 * @create 2015-05-13
###
'use strict'
mongoose = require("mongoose")
Schema = mongoose.Schema
crypto = require("crypto")

Model = mongoose.model "users", new Schema
  displayName:
    type    : String
    default : 'noname'
  hashedPassword  : String
  provider        : String
  salt            : String
  openId          : String

  facebook  : {}
  twitter   : {}
  github    : {}
  google    : {}

  # System
  role:
    type: String
    default: "user"

Model.findOrCreate = (user, done)->
  Model.findOne openId: user.openId, (err, respUser)->
    return done err if err
    # callback found user
    return done null, respUser if respUser
    # create new
    data =
      displayName: user.profile.displayName
      openId: user.openId
      provider: user.profile.provider
    # create provider profile
    data[user.profile.provider] = user.profile

    newUser = new Model data
    newUser.save (err, resp)->
      done err, resp

module.exports = Model
