module.exports = (grunt) ->

  grunt.initConfig

    gruntest:
      files: ["test/**/*.coffee"]

    coffeelint:
      files: ["test/**/*.coffee"]
      options:
        indentation:
          value: 2
          level: "warn"

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask "default", ["coffeelint", "gruntest"]
