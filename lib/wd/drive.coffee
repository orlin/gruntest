wd = require "wd"
wdSync = require "wd-sync"
_ = require "lodash"

drivers = require "./drivers"
servers = require "../servers"

module.exports = (options = {}) ->
  options.style ?= "sync"
  kind = "wd-#{options.style}"
  if options.helpers?
    helpers = require options.helpers
    options = _.merge helpers.options, options if helpers.options?

  options.serve ?= "localhost"
  options.drive ?= "phantomjs"
  options.silent ?= false
  options.timeout ?= 9000

  require "runtimer" unless options.silent

  console.error("Bad driver") unless drivers[options.drive]?
  if options.style is "q"
    b = wd.promiseRemote drivers[options.drive].host, drivers[options.drive].port
  else if options.style is "sync"
    {browser, sync} = wdSync.remote \
      drivers[options.drive].host,
      drivers[options.drive].port
    b = browser
  else console.error "Bad driver style"

  b = _.extend b, (require "./helpers/#{kind}")(options)
  b = _.extend b, helpers[kind](options) if helpers?[kind]?

  b.on "status", (info) ->
    unless options.silent
      console.log "\x1b[36m%s\x1b[0m", info

  b.on "command", (meth, path, data) ->
    unless options.silent
      console.log " > \x1b[33m%s\x1b[0m: %s", meth, path, data || ''

  server = options.server ? servers[options.serve ? "localhost"]
  if options.style is "sync"
    ["http://#{server.host}:#{server.port}", b, sync]
  else
    ["http://#{server.host}:#{server.port}", b]
