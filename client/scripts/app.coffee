###*
 * Marionette BOOK APP
 * client main app
 * @create 2015-03-11
###
'use strict'
define [
  'marionette'
  'vent'
  'router/main'
  'layout/main'
]
, (MM, Vent, Router, Layout)->
  MM.Application.extend
    el:'body'
    vents:
      Main: 'Main'

    initialize:(config)->
      @el = config.el if config.el
      Vent.on "App:#{ventName}", @[ventName], @ for ventName of @vents
      new Router()
      Backbone.history.start()
      @

    Main:->
      new Layout(
        el:@el
        ).render()
      @
