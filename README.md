# Synopsis

Stylus to CSS transformer for [James.js](https://github.com/leonidas/james.js).

```coffeescript
james  = require 'james'
coffee = require 'james-stylus'

module.exports = tasks = {}

tasks.default = ->
  james.files('src/**/*.styl')
    .map(stylus)
    .onValue james.write

```
