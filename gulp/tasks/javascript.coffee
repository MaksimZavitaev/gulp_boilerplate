gulp = require 'gulp'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
file = require 'gulp-file'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
config = global.config()

gulp.task 'js:bootstrap', ->
  if config.bootstrap.js isnt null
    src = []
    for item in config.bootstrap.js
      src.push "bower_components/bootstrap-sass/assets/javascripts/bootstrap/#{item}.js"

    gulp.src src
    .pipe concat('bootstrap.js')
    .pipe gulp.dest config.build_path

gulp.task 'js:bootstrap:minify', ['js:bootstrap'], ->
  gulp.src "#{config.build_path}bootstrap.js"
  .pipe uglify()
  .pipe rename('bootstrap.min.js')
  .pipe gulp.dest config.build_path

gulp.task 'js:vendor', ['js:bootstrap'], ->
  if config.bootstrap.js isnt null
    src = ['./bower_components/jquery/dist/jquery.js']

    gulp.src src
    .pipe concat('vendor.js')
    .pipe gulp.dest config.build_path

gulp.task 'js:vendor:minify', ['js:vendor'], ->
  gulp.src "#{config.build_path}vendor.js"
  .pipe uglify()
  .pipe rename('vendor.min.js')
  .pipe gulp.dest config.build_path
