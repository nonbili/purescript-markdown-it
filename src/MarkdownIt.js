var MarkdownIt = require("markdown-it");

exports.renderString_ = function(input) {
  var md = new MarkdownIt();
  return md.render(input);
};
