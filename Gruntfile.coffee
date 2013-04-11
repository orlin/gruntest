module.exports = (grunt) ->

  grunt.initConfig

    gruntest:
      files: ["test/**/*.coffee"]

    coffeelint:
      files: ["lib/**/*.coffee", "test/**/*.coffee"]
      options: require("sg").coffee
        opts:
          no_stand_alone_at: level: "ignore"

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks "grunt-coffeelint"

  grunt.registerTask "test", ["gruntest"]
  grunt.registerTask "default", ["coffeelint", "test"]
