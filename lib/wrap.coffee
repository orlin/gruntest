module.exports = (code) ->
  if process.env.GRUNTEST is "run"
    code() # call it right here & now
  else
    code # return it to be called elsewhere
