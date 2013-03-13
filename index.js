var james = require('james'),
   stylus = require('stylus');

module.exports = function(options) {
  return james.createStream(function(file, callback) {
    stylus.render(file, options, function(err, css) {
      if (err) {
        throw Error(err);
      }
      callback(css);
    });
  });
};
