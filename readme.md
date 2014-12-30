## Shopping List
[![Build Status](https://travis-ci.org/blainesch/shopping-list.svg?branch=master)](https://travis-ci.org/blainesch/shopping-list)

A simple example of creating integration tests for a command line app using:
* [Cucumber.js](https://www.npmjs.com/package/cucumber)
* [Phantom](https://www.npmjs.com/package/phantom)
* [Web-terminal](https://www.npmjs.com/package/web-terminal)

## Theory
What happens is we setup a terminal in the browser that can run your script and get output based on that. The scenarios know how to determine what was the last "output" of your cli.

## Dependencies for your box
* [phantom](http://phantomjs.org/)
* [coffeescript](https://www.npmjs.com/package/coffee-script)


## Run the tests
Start the web terminal `npm run-script start-term`
Run the tests `npm test`
Kill the web terminal `npm run-script stop-term`
