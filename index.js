require("coffee-script")

module.exports =
  { wrap: require("./lib/wrap")
  , plugin: require("./Gruntfile")
  , wdrive: require("./lib/wd/drive")
  }
