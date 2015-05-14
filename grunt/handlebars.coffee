###*
 * Auto Stock
 * handlebars
 * @create 2015-03-12
###
'use strict'
module.exports = (config)->
  compile:
    options:
      amd: true
      namespace: "HBS"
      processName:(filePath)->
        filePath.replace( 'client/scripts/templates/', '').replace /\.hbs$/, ''


      processContent:(content, filepath)->
        content = content.replace(/[\r\n]+/g, ' ').replace(/\s+/g,' ')
        content
    files:
      "public/scripts/templates.js": ["client/scripts/templates/**/*.hbs"]
