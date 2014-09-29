var e, err, file, fs, literature, program, version, _i, _len, _ref;

fs = require('fs');

literature = (require('./literature'))({});

program = require('commander');

try {
  version = require('./package.json').version;
} catch (_error) {
  e = _error;
  version = require('../package.json').version;
}

program.version(version).usage('<file ...>').parse(process.argv);

if (program.args.length === 0) {
  program.outputHelp();
  process.exit(64);
}

_ref = program.args;
for (_i = 0, _len = _ref.length; _i < _len; _i++) {
  file = _ref[_i];
  try {
    console.log(literature(fs.readFileSync(file, 'utf-8')));
  } catch (_error) {
    err = _error;
    console.error(err.toString());
    process.exit(66);
  }
}
