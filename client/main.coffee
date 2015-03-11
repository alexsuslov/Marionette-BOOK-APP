###*
 * Marionette BOOK APP
 * main client file
 * require config
 * @create 2015-03-11
###
'use strict'
require.config
  waitSeconds: 0
  shim:
    underscore  : exports: '_'
    backbone    :
      deps        : ['jquery', 'underscore']
      exports     : 'BB'
    marionette:
      deps        : ['backbone']
      exports     : 'MM'

  paths:
    bootstrap   : '../deps/bootstrap/dist/js/bootstrap'
    backbone    : '../deps/backbone/backbone'
    marionette  : '../deps/marionette/lib/core/backbone.marionette'
    handlebars  : '../deps/handlebars/handlebars'

require [], ->
  getCookie = (name)->
    if matches = document.cookie.match new RegExp(
      "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
      )
      decodeURIComponent(matches[1])

  console.log getCookie 'user'
  console.log 'App start'

