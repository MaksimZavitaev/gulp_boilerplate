gulp = require 'gulp'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
file = require 'gulp-file'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
config = global.config()

gulp.task 'js:vendor', ->
  if config.bootstrap.js isnt null
    src = ['./bower_components/jquery/dist/jquery.js']

    for item in config.bootstrap.js
      src.push "bower_components/bootstrap-sass/assets/javascripts/bootstrap/#{item}.js"

    gulp.src src
    .pipe concat('vendor.js')
    .pipe gulp.dest config.build_path

gulp.task 'js:vendor:min', ['js:vendor'], ->
  gulp.src "#{config.build_path}/vendor.js"
  .pipe uglify()
  .pipe rename 'vendor.min.js'
  .pipe gulp.dest config.build_path
