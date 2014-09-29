#!/usr/bin/env coffee

fs        = require 'fs'
literature= require './literature'

program = require 'commander'

try
  # distribution
  version = require('./package.json').version
catch e
  # dev / testing
  version = require('../package.json').version

program
  .version(version)
  .usage('<file ...>')
  .parse process.argv

if program.args.length is 0
  program.outputHelp()
  process.exit 64 # EX_USAGE command line usage error

for file in program.args
  try
    console.log literature fs.readFileSync(file, 'utf-8')
  catch err
    console.error err.toString()
    process.exit 66 # EX_NOINPUT cannot open input
