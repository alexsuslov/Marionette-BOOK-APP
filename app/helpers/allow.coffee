module.exports = (opts)->
  throw new Error 'no options' unless opts
  try
    # Роли рользователя
    roles = ['anonymous']
    objType = (obj)-> Object.prototype.toString.call obj
    if opts.user?.role
      roles = switch objType(opts.user.role)
        when '[object Array]' then opts.user.role
        when "[object String]" then opts.user.role.split ','

    # события
    throw new Error ' no events' unless opts.events?.error
    events = opts.events

    # Группы
    groups = [
      'admin', 'manager', 'buch', 'stock'
      'partner', 'dealer', 'user', 'anonymous'
    ]
    if opts.groups
      groups = switch objType(opts.groups)
        when '[object Array]' then opts.groups
        when "[object String]" then opts.groups.split ' '

    # обработчик ролей
    for group in groups
      # проверка на группу
      if (group in roles)
        # выполним метод с именим группы
        return events[group]() if typeof events[group] is 'function'
    # отрабатываем ошибку
    events.error() if typeof events.error is 'function'
  catch e
    console.log e
