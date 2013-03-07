james = require 'james'
coffee = require 'james-coffee'

module.exports = tasks = {}

tasks.build = ->
  james.files('src/stylus.coffee').map(coffee).onValue james.write

  # TODO also update index.js