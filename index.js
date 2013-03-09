(function() {
  var Q, james, stylus;

  james = require('james');

  stylus = require('stylus');

  Q = require('q');

  module.exports = james.transformer(function(file) {
    return Q.nfcall(stylus.render, file.content, {
      name: file.name
    }).then(function(css) {
      return {
        content: css,
        name: file.name.replace(/.(stylus|styl)$/, '.css')
      };
    });
  });

}).call(this);
