###*
 * Marionette BOOK APP
 * permit action by first user group
 * @create 2015-03-11
###
'use strict'

class Pass
  groups:['admin', 'manager','user', 'anonymous']
  roles:['anonymous']


  ###*
   * Разрешение
   * @param [Object] options
   * @option options [String || Array] group
   * @option options [String || Array] roles
   * @option options [String || Array] events
   * @return void
  ###
  allow:(options)->
    throw new Error 'no allow rules' unless options
    throw new Error 'no user' unless options.user
    throw new Error 'no allow events' unless options.events
    throw new Error 'no allow events error' unless options.events.error

    unless options.user.role
      return options.events.error() if typeof options.events?.error is 'function'

    # события
    events = options.events

    # roles / groups
    @roles= @toArray options.user.role if options?.user?.role
    @groups = @toArray options.groups if options?.groups

    # console.log @roles
    # console.log @groups

    # обработчик ролей
    for group in @groups
      # проверка на группу
      if (group in @roles)
        # выполним метод с именим группы
        return options.events[group]() if typeof options.events[group] is 'function'
    # отрабатываем ошибку
    options.events.error() if typeof options.events.error is 'function'
    @


  ###*
   * [constructor description]
   * @param  {[type]} options параметры
   * @option options [String || Array] groups
   * @option options [String || Array] groups
   * @return {[type]}         [description]
  ###
  constructor:(options)->
    @groups = @toArray options.groups if options?.groups
    @


  ###*
   * Преобразовать строку в массив
   * @param  {String || Array} data [description]
   * @return {Array}
  ###
  toArray:(data)->
    return [] unless data
    switch @typeOf data
      when '[object Array]' then data
      when '[object String]' then data.split ' '


  ###*
   * Тип объекта
   * @param  {[type]} obj объект
   * @return {String} название типа
  ###
  typeOf:(obj)-> Object.prototype.toString.call obj

module.exports = Pass
