###*
 * Marionette BOOK APP
 * sass
 * @create 2015-03-12
###
'use strict'
module.exports = (config)->
  compile:
    files:[
      expand: true
      cwd: 'scss'
      src: ['*.scss']
      dest: 'public/css'
      ext: '.css'
    ]
