###*
 * Marionette BOOK APP
 * Auth github controller
 * @create 2015-03-11
###
'use strict'
passport  = require("passport")
express   = require 'express'
router    = express.Router()

###*
 * passport.authenticate
###
router.get '/', passport.authenticate 'github'


###*
 * Return url
 * @param  {Object}   req  express
 * @param  {Object}   res  express
 * @param  {Function} next
 * @return void
###
router.get '/return', (req, res, next)->
  passport.authenticate('github', (err, user, info)->
    return next err if err
    return res.redirect '/' unless user
    req.logIn user, (err) ->
      return next err if err
      # redirect to back page
      if req.session.backUrl
        res.redirect req.session.backUrl
      else
        res.redirect '/'
  ) req, res, next


module.exports = router
