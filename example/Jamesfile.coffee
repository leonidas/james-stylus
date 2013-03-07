james = require 'james'
stylus = require 'james-stylus'

module.exports = tasks = {}

tasks.stylus = ->
  james.files('example.styl').flatMap(stylus).onValue james.write