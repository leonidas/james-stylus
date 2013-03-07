(function() {
  var Bacon, stylus;

  stylus = require('stylus');

  Bacon = require('baconjs').Bacon;

  module.exports = function(files) {
    return Bacon.fromArray(files).flatMap(function(file) {
      return Bacon.fromCallback(function(callback) {
        return stylus.render(file.content, {
          name: file.name
        }, function(err, css) {
          return callback([
            {
              content: css,
              name: file.name.replace(/.(stylus|styl)$/, '.css')
            }
          ]);
        });
      });
    });
  };

}).call(this);
