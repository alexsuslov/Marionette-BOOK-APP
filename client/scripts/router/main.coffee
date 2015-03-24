###*
 * Marionette BOOK APP
 * main router
 * @create 2015-03-12
###
'use strict'
define [
  'marionette'
  'router/controller'
]
, (MM, Controller)->
  MM.AppRouter.extend
    appRoutes:
      '*path':    'defaultRoute'

    initialize:->
      @controller = new Controller()
      @


