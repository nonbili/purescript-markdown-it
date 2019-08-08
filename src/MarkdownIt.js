var MarkdownIt = require("markdown-it");

exports.renderString_ = function(input) {
  var md = new MarkdownIt();
  return md.render(input);
};

exports.newMarkdownIt_ = function(preset, opts) {
  return new MarkdownIt(preset, opts);
};

exports.render_ = function(md, input) {
  return md.render(input);
};

exports.renderInline_ = function(md, input) {
  return md.renderInline(input);
};

exports.usePlugin_ = function(plugin, md) {
  md.use(require(plugin));
  return md;
};
