###*
 * Auto Stock
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
      cwd: "client/scripts"
      src: "**/*.coffee"
      dest: "public/scripts"
      ext: ".js"
    ]
