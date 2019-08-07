var MarkdownIt = require("markdown-it");

exports.renderString_ = function(input) {
  var md = new MarkdownIt();
  return md.render(input);
};

exports.newMarkdownIt_ = function(opts) {
  return new MarkdownIt(opts);
};

exports.render_ = function(input, md) {
  return md.render(input);
};
