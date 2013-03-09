assert  = require 'assert'
{Bacon} = require 'baconjs'
Q       = require 'q'
james   = require 'james'
stylus  = require '../index.js'


describe 'james-stylus', ->

  it 'should transform stylus files to css', (done) ->

    files = [
      Q.when(
        name: "foo.styl"
        content: """
          body
            background red
          """),

      Q.when(
        name: "bar.styl"
        content: """
          body
            background blue
          """)
    ]

    Bacon.once(files).map(stylus).onValue (files) ->
      Q.all(files).then((files) ->
        assert.deepEqual files, [
          name: "foo.css"
          content: """
            body {
              background: #f00;
            }

            """
        ,
          name: "bar.css"
          content: """
            body {
              background: #00f;
            }

            """
        ]
      ).done done
