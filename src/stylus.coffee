stylus = require 'stylus'
{Bacon} = require 'baconjs'

module.exports = (files) ->
  Bacon.fromArray(files).flatMap (file) ->
    Bacon.fromCallback (callback) ->
      stylus.render file.content, name: file.name, (err, css) ->
        # TODO errors
        callback [
          content: css
          name: file.name.replace /.(stylus|styl)$/, '.css'
        ]