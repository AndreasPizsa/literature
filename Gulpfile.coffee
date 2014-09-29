coffee= require 'gulp-coffee'
gulp  = require 'gulp'
gutil = require 'gulp-util'
mocha = require 'gulp-mocha'
verb  = require 'gulp-verb'

gulp.task 'docs', ->
  gulp.src ['.verbrc.md']
    .pipe verb dest:'README.md'
    .pipe gulp.dest './'

gulp.task 'test', ['compile'], ->
  gulp.src './test/*.{js,coffee,litcoffee}'
  .pipe mocha()

gulp.task 'compile',->
  path = require 'path'

  gulp.src './src/*.{coffee,litcoffee}'
    .pipe coffee bare:true
      .on 'error', gutil.log
    .pipe gulp.dest path.dirname require('./package.json').main

gulp.task 'default', ['compile','test', 'docs']
