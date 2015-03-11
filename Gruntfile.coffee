###*
 * Marionette BOOK APP
 * Grunt file
 * @create 2015-03-11
###
'use strict'
module.exports = (grunt)->
  require("time-grunt") grunt
  require("load-grunt-tasks") grunt
  # настройки автоматизатора
  reloadPort = 35729
  config =
    public  :  'public'
    # место создание дистрибутива
    dist    :  'dist'
    # серверные скрипты
    server  :  'app'
    # скрипты для браузера
    client  : 'client'
    # верстка
    jade    : 'jade'

  grunt.initConfig
    # подключаем файл пакета
    pkg: grunt.file.readJSON 'package.json'
    # bwr: grunt.file.readJSON 'bower.json'

    # Сlean
    # очистка временных файлов
    clean: require('./grunt/clean') config
    # coffee
    coffee: require('./grunt/coffee') config

    # watch
    watch: require('./grunt/watch') reloadPort, config

    develop:
      server:
        file: "app.js"

  grunt.registerTask 'serve',[
    'clean:develop'
    'coffee:client'
    'develop'
    'watch'
  ]
