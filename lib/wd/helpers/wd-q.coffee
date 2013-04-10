util = require "util"
inspect = require "./inspect"

# NOTE: wd with promises was an experiment, prefer wd-sync.
# Will not maintain the same hepers synced - in either way.

module.exports = (options) ->

  behold: ->
    @init({nativeEvents: true})
      .then =>
        @able() unless options.silent

  able: ->
    @sessionCapabilities()
      .then (capabilities) ->
        inspect capabilities

  # get a waited element by: waits for it to be present, up to options.timeout, then returns it
  getWEBy: (kind, value, cb) ->
    @["waitForElementBy#{kind}"](value, options.timeout, cb)
      .then =>
        @["elementBy#{kind}OrNull"](value)

  cYa: (t) ->
    t.end() if t? # using node-tap possible?
    @quit()
    unless options.silent
      console.log()
      util.log "\n"

  onRejected: (err) ->
    console.error err if err and options.debug
