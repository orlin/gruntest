module.exports = (grunt) ->

  grunt.initConfig

    gruntest:
      files: ["test/**/*.coffee"]

    coffeelint:
      files: ["lib/**/*.coffee", "test/**/*.coffee"]
      options:
        indentation:
          value: 2
          level: "warn"
        max_line_length: level: "ignore"

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask "default", ["coffeelint", "gruntest"]
