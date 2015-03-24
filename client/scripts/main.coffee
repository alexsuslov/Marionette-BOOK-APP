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
    'backbone.wreqr':
      deps        : ['backbone']
    HBS:
      deps: ['handlebars']

  paths:
    bootstrap   : '../deps/bootstrap/dist/js/bootstrap'
    jquery      : '../deps/jquery/dist/jquery'
    underscore  : '../deps/underscore/underscore'
    backbone    : '../deps/backbone/backbone'
    marionette  : '../deps/marionette/lib/core/backbone.marionette'
    handlebars  : '../deps/handlebars/handlebars'
    HBS         : 'templates'

    'backbone.wreqr'      : '../deps/backbone.wreqr/lib/backbone.wreqr'
    'backbone.babysitter' : '../deps/backbone.babysitter/lib/backbone.babysitter'
    'jquery-migrate'    : '../deps/jquery-migrate/jquery-migrate'
    'jquery-ui'         : '../deps/jquery-ui/jquery-ui'
    'bootstrap-hover-dropdown' : '../deps/bootstrap-hover-dropdown/bootstrap-hover-dropdown'
    'jquery.slimscroll' : '../deps/jquery.slimscroll/jquery.slimscroll'
    'jquery.blockUI'    : '../deps/blockui/jquery.blockUI'
    'jquery.uniform'    : '../deps/jquery.uniform/jquery.uniform'
    'bootstrap-switch'  : '../deps/bootstrap-switch/dist/js/bootstrap-switch'

    'jquery.vmap'       : '../deps/jqvmap/jqvmap/jquery.vmap'

    'jquery.vmap.russia'  : '../deps/jqvmap/jqvmap/maps/jquery.vmap.russia'

a = [

  '../deps/jquery.cokie.min.js'

  '../deps/jqvmap/jqvmap/maps/jquery.vmap.russia.js'
  '../deps/jqvmap/jqvmap/maps/jquery.vmap.world.js'
  '../deps/jqvmap/jqvmap/maps/jquery.vmap.europe.js'
  '../deps/jqvmap/jqvmap/maps/jquery.vmap.germany.js'
  '../deps/jqvmap/jqvmap/maps/jquery.vmap.usa.js'
  '../deps/jqvmap/jqvmap/data/jquery.vmap.sampledata.js'

  '../deps/morris/morris.min.js'
  '../deps/morris/raphael-min.js'
  '../deps/jquery.sparkline.min.js'

  '../../assets/global/scripts/metronic.js'
  '../../assets/admin/layout4/scripts/layout.js'
  '../../assets/admin/layout4/scripts/demo.js'
  '../../assets/admin/pages/scripts/index3.js'
  '../../assets/admin/pages/scripts/tasks.js'
]





require ['app'], (App)->
  getCookie = (name)->
    if matches = document.cookie.match new RegExp(
      "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
      )
      decodeURIComponent(matches[1])

  config =
    user  : getCookie 'user'
    el    : 'body'

  new App(config)
