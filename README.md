# gruntest -- grunt test tests with the best [![Build Status](https://secure.travis-ci.org/orlin/gruntest.png)](http://travis-ci.org/orlin/gruntest)


## What

Front-end testing web driver helpers …

The grunt plugin task is not working yet.
After that's done, there will be more documentation, tests, and some examples.


## Install

Gruntest depends on webdriver-enabled browsers, headless or otherwise, and the various webdrivers or services, without which such webdriven tests won't run.  Here are some options, of which, just the first two have been tried / confirmed to work.

### PhantomJS

[Phantom](http://phantomjs.org) is the easiest way to get started, also the default.  It comes with a webdriver called `ghostdriver`.  Run it with `phantomjs --webdriver=9134`.  If you must use a different port, `gruntest` should be told / configured accordingly.

### Selenium 2

With [Selenium](http://docs.seleniumhq.org), one can drive pretty much any browser.  Chrome is `gruntest`'s, further configurable, choice - for which, one also needs Google's [chromedriver](https://code.google.com/p/chromedriver/downloads/list).  Turn it on using the `drive: "selenium"` option.

### Sauce Labs

This hasn't been tried, nor tested yet.  With a little configuration, it should work just fine.  You will likely need [an account](https://saucelabs.com) and a server where the site / app being tested is reachable via Internet - obviously not the totally `localhost` kind of testing.

### Zombie.js

Well, not there yet, but maybe some day.  I spotted this [node-wd-zombie](https://github.com/sebv/node-wd-zombie), which I bet will take quite some time to get worked out.  [Zombie](https://github.com/assaf/zombie) `2.0` is still far from stable, and then somebody should want to webdrive it?


## Law

This is free and unencumbered public domain software. For more information,
see <http://unlicense.org/>.

