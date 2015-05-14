###*
 * Auto Stock
 * queue config
 * @create 2015-03-24
###
config  = require '../config'
events  = require 'events'
queue   = new events.EventEmitter()

glob    = require 'glob'
path    = require 'path'
files   = glob.sync config.root + '/app/queue/*.coffee'

files.forEach (file)->
  try
    for name of require(file)
      queue.on path.basename( file, '.coffee') + ":#{name}", require(file)[name]
  catch e
    console.log('Error Events: ' + file, e)

module.exports = queue
