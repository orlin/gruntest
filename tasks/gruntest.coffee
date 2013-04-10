path = require "path"

module.exports = (grunt) ->

  grunt.registerMultiTask "gruntest", "Grunt runs test tests", ->
    options = @options
      silent: false

    grunt.log.writeln "#{this.target}: #{this.data}" unless options.silent

    @files.forEach (file) ->
      for f in file.src
        console.log "gruntest #{f}"
        require(path.resolve f)(options)
