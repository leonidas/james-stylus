coffee = require 'coffee-script'

module.exports = (files) ->
  files.map (file) ->
    content: coffee.compile file.content
    name: file.name.replace /.coffee$/, '.js'
