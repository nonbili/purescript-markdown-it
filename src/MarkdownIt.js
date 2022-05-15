import MarkdownIt from "markdown-it";

export function renderString_(input) {
  var md = new MarkdownIt();
  return md.render(input);
};

export function newMarkdownIt_(preset, opts) {
  if (opts.highlight) {
    const fn = opts.highlight;
    opts.highlight = (str, lang) => fn(str)(lang);
  }
  return new MarkdownIt(preset, opts);
};

export function render_(md, input) {
  return md.render(input);
};

export function renderInline_(md, input) {
  return md.renderInline(input);
};

export function use_(plugin, md) {
  return md.use(plugin);
};
