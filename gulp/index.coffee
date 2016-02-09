gulp = require 'gulp'
requireDir = require 'require-dir'
runSequence = require 'run-sequence'

global.config = ->
  fs = require 'fs'
  path = require 'path'
  filename = path.join(__dirname, 'config.yml')
  contents = fs.readFileSync(filename, 'utf8')
  yaml = require 'js-yaml'
  data = yaml.load(contents)
  return data

# Подключаем все задачи из gulp/tasks, включая подкаталоги
requireDir './tasks', recurse: true
