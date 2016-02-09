gulp = require 'gulp'
uglify = require 'gulp-uglify'
concat = require 'gulp-concat'
file = require 'gulp-file'
notify = require 'gulp-notify'
rename = require 'gulp-rename'
config = global.config()

gulp.task 'js:vendor', ->
  src = ['./bower_components/jquery/dist/jquery.js'] if config.bootstrap.js isnt null

  if config.bootstrap.js isnt null
    for item in config.bootstrap.js
      src.push item

    gulp.src src
    .pipe concat()
    .pipe gulp.dest config.build_path
