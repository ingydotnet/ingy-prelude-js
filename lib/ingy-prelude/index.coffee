# Ingy döt Net's Prelude for NodeJS programming:

require('lodash').extend global,
  IngyPrelude: VERSION: '0.0.2'

  # Use lodash:
  _: require 'lodash'

  # Use most common builtin modules:
  fs: require 'fs'
  path: require 'path'

  # Other common useful modules:
  sprintf: require('sprintf-js').sprintf

  # Common I/O and termination functions:
  out: (string)->
    process.stdout.write String string
  err: (string)->
    process.stderr.write String string
  say: (string...)->
    out "#{string.join ' '}\n"
  warn: (string...)->
    err "#{string.join ' '}\n"
  exit: (rc=0)->
    process.exit rc
  die: (msg)->
    throw "Died: #{msg}\n"

  # Synchronous disk I/O functions:
  file_read: (file_path)->
    if file_path == '-'
      fs.readFileSync('/dev/stdin').toString()
    else
      fs.readFileSync(file_path).toString()
  file_write: (file_path, output)->
    if file_path == '-'
      fs.writeFileSync('/dev/stdout', output)
    else
      fs.writeFileSync(file_path, output)
  file_exists: (file_path)->
    fs.existsSync file_path

  # Debugging functions:
  dump: (data...)->
    util = require 'util'
    dump = ''
    for elem in data
      dump += util.inspect(elem) + '\n...\n'
    dump
  jjj: (data...)->
    for elem in data
      say JSON.stringify elem, null, 2
    say '...'
    data[0]
  www: (data...)->
    err dump data...
    data[0]
  xxx: (data...)->
    err dump data...
    throw ''
  yyy: (data...)->
    out dump data...
    data[0]
  DUMP: (data...)->
    yaml = require 'yaml'
    dump = ''
    for elem in data
      dump += "---\n#{yaml.stringify elem}...\n"
    dump
  WWW: (data...)->
    err DUMP data...
    data[0]
  XXX: (data...)->
    err DUMP data...
    throw ''
  YYY: (data...)->
    out DUMP data...
    data[0]
