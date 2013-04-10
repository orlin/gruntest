module.exports = (grunt) ->

  grunt.initConfig

    gruntest:
      files: ["test/**/*.coffee"]

    coffeelint:
      files: ["lib/**/*.coffee", "test/**/*.coffee"]
      options: require("styleguide").coffee()

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask "default", ["coffeelint", "gruntest"]
