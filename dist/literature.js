var literate, nothing, _;

_ = require('lodash');

nothing = function() {
  return '';
};

literate = {
  marked: function(markdown, options) {
    var fun, marked, renderer, _i, _len, _ref;
    marked = require('marked');
    renderer = new marked.Renderer();
    _ref = _.functions(renderer);
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      fun = _ref[_i];
      renderer[fun] = nothing;
    }
    renderer.code = function(code, lang, escaped) {
      if (lang) {
        return '';
      } else {
        return code;
      }
    };
    return marked(markdown, {
      renderer: renderer
    });
  },
  remarkable: function(markdown, options) {
    var Remarkable, fun, md, renderer, _i, _len, _ref;
    Remarkable = require('remarkable');
    md = new Remarkable;
    console.log(_.functions(md));
    renderer = md.renderer;
    console.log(_.functions(renderer));
    _ref = _.functions(renderer);
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      fun = _ref[_i];
      renderer[fun] = nothing;
    }
    renderer.code = function(tokens, idx) {
      return 'CODE';
      if (tokens[idx].block) {
        return tokens[idx].content;
      } else {
        return '';
      }
    };
    return md.render(markdown);
  }
};

module.exports = literate.marked;

if (module === require.main) {
  require('./literature-cli');
}
