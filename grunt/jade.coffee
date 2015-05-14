###*
 * Auto Stock
 * jade
 * @create 2015-03-12
###
'use strict'
module.exports = (config)->
  client:
    options:
      pretty: true
    files:[
      expand: true
      cwd: "client/jade/"
      src: "**/*.jade"
      dest: "client/scripts/templates/"
      ext: ".hbs"
    ]
