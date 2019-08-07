var MarkdownIt = require("markdown-it");

exports.renderString_ = function(input) {
  var md = new MarkdownIt();
  return md.render(input);
};

exports.newMarkdownIt_ = function(preset, opts) {
  return new MarkdownIt(preset, opts);
};

exports.render_ = function(input, md) {
  return md.render(input);
};
