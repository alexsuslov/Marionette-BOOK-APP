###*
 * Marionette BOOK APP
 * Watch
###
'use strict'
module.exports = (reloadPort, config)->
  options:
    nospawn: true
    livereload: reloadPort

  serverScripts:
    files:[
      'Gruntfile.coffee'
      "/app/**/*.coffee"
      "/config/*.coffee"
      'grunt/*.coffee'
    ]