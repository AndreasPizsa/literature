chmod = require 'gulp-chmod'
coffee= require 'gulp-coffee'
concat= require 'gulp-concat'
gulp  = require 'gulp'
gutil = require 'gulp-util'
mocha = require 'gulp-mocha'
path  = require 'path'
verb  = require 'gulp-verb'

destDir = path.dirname require('./package.json').main

gulp.task 'docs', ->
  gulp.src ['.verbrc.md']
    .pipe verb dest:'README.md'
    .pipe gulp.dest './'

gulp.task 'test', ['compile'], ->
  gulp.src './test/*.{js,coffee,litcoffee}'
  .pipe mocha()

gulp.task 'bin', ['compile','test'], ->
  jsFile = "#{destDir}/literature-cli.js"
  gulp.src ['./src/literature-cli-prefix.txt',jsFile]
    .pipe concat('literature-cli.js')
    .pipe chmod 755
    .pipe gulp.dest destDir

gulp.task 'compile',->

  gulp.src './src/*.{coffee,litcoffee}'
    .pipe coffee bare:true
      .on 'error', gutil.log
    .pipe gulp.dest destDir

gulp.task 'default', ['compile','test', 'docs']
