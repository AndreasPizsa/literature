#!/usr/bin/env coffee

_ = require 'lodash'

nothing = -> ''

literate =
  marked: (markdown, options)->
    marked = require 'marked'

    renderer = new marked.Renderer();
    renderer[fun] = nothing for fun in _.functions(renderer)

    renderer.code = (code, lang, escaped)->
      return if lang then '' else code

    marked markdown, renderer:renderer

  remarkable: (markdown, options)->
    Remarkable = require 'remarkable'
    md = new Remarkable
    console.log _.functions md
    renderer = md.renderer
    console.log _.functions renderer
    renderer[fun] = nothing for fun in _.functions(renderer)
    renderer.code = (tokens, idx)->
      return 'CODE'
      return if tokens[idx].block then tokens[idx].content else ''

    md.render markdown

module.exports = literate.marked

if module is require.main then require './literature-cli'
