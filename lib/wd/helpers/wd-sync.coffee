util = require "util"
inspect = require "./inspect"
assert = require("chai").assert

module.exports = (options) ->

  behold: ->
    # inspect "@status": @status() unless options.silent # look at sessionCapabilities - duplicate info
    @init
      nativeEvents: true
      # browserName & driver don't matter unless `options.drive is "selenium"`
      browserName: "chrome"
      driver: "chromedriver"
    inspect "@sessionCapabilities": @sessionCapabilities() unless options.silent

  waitForSelector: (css, opts = {}) ->
    opts.ms ?= options.timeout
    opts.msg ?= "the element identified by '#{css}' was expected to be present within #{opts.ms} ms"
    opts.assert ?= true # sometimes not having found an element shouldn't be alarming
    @setWaitTimeout opts.ms
    element = @elementByCssOrNull css
    assert.isNotNull(element, opts.msg) if opts.assert
    element

  waitForSelectorChain: (css, chain, opts = {}) ->
    opts.ms ?= options.timeout
    @waitForSelector css, opts
    @eval "$('#{css}').#{chain}"

  cYa: (t) ->
    t.end() if t? # using node-tap possible?
    @quit()
    unless options.silent
      console.log()
      util.log "\n"
