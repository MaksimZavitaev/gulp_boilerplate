gulp = require 'gulp'
sass = require 'gulp-sass'
file = require 'gulp-file'
notify = require 'gulp-notify'
cssmin = require 'gulp-cssmin'
rename = require 'gulp-rename'
config = global.config()

gulp.task 'sass:bootstrap:compile', [], ->
  src = ''
  for item in ['variables', 'mixins']
    src += "@import 'bootstrap/#{item}';\n"

  for item in config.bootstrap.css
    src += "@import 'bootstrap/#{item}';\n"

  file('bootstrap.scss', src, {src: true})
  .pipe sass includePaths: './bower_components/bootstrap-sass/assets/stylesheets'
  .pipe gulp.dest config.build_path + config.css_folder
  .pipe notify {
    title  : "Файл скомпилирован"
    message: "Найти файл можно в #{config.build_path + config.css_folder}/<%= file.relative %>!"
  }

gulp.task 'sass:bootstrap:minify', ['sass:bootstrap:compile'], ->
  gulp.src "#{config.build_path + config.css_folder}/bootstrap.css"
  .pipe cssmin()
  .pipe rename 'bootstrap.min.css'
  .pipe gulp.dest config.build_path + config.css_folder
  .pipe notify {
    title  : "Файл скомпилирован"
    message: "Найти файл можно в #{config.build_path + config.css_folder}/<%= file.relative %>!"
  }
