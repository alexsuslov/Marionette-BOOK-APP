###*
 * Auto Stock
 * Watch
###
'use strict'
module.exports = (reloadPort, config)->
  options:
    nospawn: true
    livereload: reloadPort
  scss:
    files:['scss/**/*.scss']
    tasks:['sass:compile']

  jadeClient:
    files:[
      'client/**/*.jade'
    ]
    tasks:['jade:client','handlebars:compile']

  hbsClient:
    files:[
      'client/scripts/templates/**/*.hbs'
    ]
    tasks:['handlebars:compile']

  clientScripts:
    files:[
      'client/**/*.coffee'
    ]
    tasks:[
      'coffee:client'
    ]

  serverScripts:
    options:
      livereload: reloadPort
    files:[
      'Gruntfile.coffee'
      "app/**/*.coffee"
      "config/*.coffee"
      'grunt/*.coffee'
      'public/scripts/**/*.js'
    ]
