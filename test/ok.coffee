#!/usr/bin/env GRUNTEST=run coffee

assert = require("chai").assert

module.exports = require("../index").wrap (o = {}) ->
  console.log "this is a passing test, that always reveals its options:"
  console.log o

  assert.ok true, "gruntest's true is ok"
