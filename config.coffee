###*
 * Auto Stock
 * app config
 * @create 2015-05-13
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
    db  : 'mongodb://localhost/auto-stock'
    passport:
      google:
        callbackURL:'http://localhost:9000/auth/google/return'
        clientID:'1072418535460-durnlifrqel8i1mgqc6tq3635amhug26.apps.googleusercontent.com'
        clientSecret:'bKtl0iXtuwQK--30CQ2CvUWJ'

module.exports = config[env]
