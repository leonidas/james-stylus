james = require 'james'
stylus = require 'james-stylus'

module.exports = tasks = {}

tasks.stylus = ->
  james.files('*.styl').flatMap(stylus).onValue james.write