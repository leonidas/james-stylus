james  = require 'james'
stylus = require 'stylus'
Q      = require 'q'

module.exports = james.transformer (file) ->
  Q.nfcall(stylus.render, file.content, name: file.name)
    .then (css) ->
      content: css
      name:    file.name.replace /.(stylus|styl)$/, '.css'
