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

module.exports = config[env]
