###*
 * Auto Stock
 * passport config
 * @create 2015-03-11
###
'use strict'
mongoose        = require 'mongoose'
User            = mongoose.model 'users'
passport        = require 'passport'
GitHubStrategy  = require('passport-github').Strategy
GoogleStrategy  = require('passport-google-oauth').OAuth2Strategy
crypto          = require 'crypto'

###*
 * findOrCreate
 * @param  {Object}   profile
 * @param  {Function} done    callback
 * @return void
###
findOrCreate = (profile, done)->
  User.findOrCreate {openId: profile.id, profile: profile}
  , (err, user)->
    done(err, user)


module.exports = (config)->
  ###*
   * serializeUser
   * @param  {[type]}   user [description]
   * @param  {Function} done [description]
   * @return {[type]}        [description]
  ###
  passport.serializeUser (user, done) ->
    done null, user.id

  ###*
   * deserializeUser
   * @param  {[type]}   id   [description]
   * @param  {Function} done [description]
   * @return {[type]}        [description]
  ###
  passport.deserializeUser (id, done) ->
    User.findOne _id: id, "-salt -hashedPassword", (err, user) ->
      # don't ever give out the password or salt
      done err, user

  ###*
   * GitHubStrategy
  ###
  if config.passport.github
    passport.use new GitHubStrategy config.passport.github
    , (accessToken, refreshToken, profile, done)->
      profile.provider = 'github'
      findOrCreate profile, done

  ###*
   * GoogleStrategy
  ###
  if config.passport.google
    passport.use new GoogleStrategy config.passport.google
    , (token, tokenSecret, profile, done)->
      profile.provider = 'google'
      findOrCreate profile, done
