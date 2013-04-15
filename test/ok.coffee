#!/usr/bin/env GRUNTEST=run coffee

findup = require "findup-sync"
assert = require("chai").assert

module.exports = require(findup "index.js").wrap (o = {}) ->
  console.log "this is a passing test, that always reveals its options:"
  console.log o

  assert.ok true, "gruntest's true is ok"
