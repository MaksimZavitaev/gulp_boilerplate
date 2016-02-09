gulp = require 'gulp'
sass = require 'gulp-sass'
file = require 'gulp-file'
notify = require 'gulp-notify'
config = global.config()

gulp.task 'sass:bootstrap:compile', [], ->
  src = ''
  items = [
    'variables'
    'mixins'
    'normalize'
    'print'
    'glyphicons'
  ]

  for item in items
    src += "@import 'bootstrap/#{item}';\n"

  for item in config.bootstrap
    src += "@import 'bootstrap/#{item}';\n"

  #noinspection JSUnresolvedVariable
  file('bootstrap.scss', src)
  .pipe sass includePaths: './bower_components/bootstrap-sass/assets/stylesheets'
  .pipe gulp.dest config.build_path
  .pipe notify {
    title  : "Файл скомпилирован"
    message: "Найти файл можно в #{config.build_path}<%= file.relative %>!"
  }