###*
 * Marionette BOOK APP
 * Coffee-script
###
'use strict'
module.exports = (config)->
  client:
    options:
      bare: true
      sourceMap: false
    files:[
      expand: true
      cwd: "client"
      src: "**/*.coffee"
      dest: "public/scripts"
      ext: ".js"
    ]
