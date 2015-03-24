###*
 * Marionette BOOK APP
 * main controller
 * @create 2015-03-12
###
'use strict'
define ['marionette','vent']
, (MM, Vent)->
  Marionette.Controller.extend

    initialize:->
      @
    defaultRoute:(queryString)->
      Vent.trigger 'App:Main'
      @
