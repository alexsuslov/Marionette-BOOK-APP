###*
 * Marionette BOOK APP
 * app config
 * @create 2015-03-11
###
'use strict'
rootPath = __dirname
env      = process.env.NODE_ENV || 'development'

config =
  production:false
  development:
    root: rootPath
    host: 'localhost'
    port: 9000
    db  : 'mongodb://localhost/book-app'
    passport:
      github:
        clientID:'641f28b1f62bd04c1159'
        clientSecret:'4617396ebf615193b31d94e5a0bcecb394ced197'
        callbackURL: 'http://localhost:9000/auth/github/return'
      google:
        callbackURL:'http://localhost:9000/auth/google/return'
        clientID:'1072418535460-durnlifrqel8i1mgqc6tq3635amhug26.apps.googleusercontent.com'
        clientSecret:'bKtl0iXtuwQK--30CQ2CvUWJ'

module.exports = config[env]
