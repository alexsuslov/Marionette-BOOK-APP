###*
 * Marionette BOOK APP
 * main layout
 * @create 2015-03-12
###
'use strict'
define ['marionette','HBS']
, (MM)->
  Marionette.LayoutView.extend
    template: HBS['views/layout']

    initialize:->
      console.log 'LayoutView start'
      @

