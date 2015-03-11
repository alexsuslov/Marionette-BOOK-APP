###*
 * Marionette BOOK APP
 * Clean
###
'use strict'
module.exports = (config)->
  develop   : [
    "#{config.public}/scripts"
    "#{config.client}/scripts/templates"
  ]
  release   : ["#{config.dist}"]
