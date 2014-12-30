## Shopping List

A simple example of creating integration tests for a command line app using:
* [Cucumber.js](https://www.npmjs.com/package/cucumber)
* [Phantom](https://www.npmjs.com/package/phantom)
* [Web-terminal](https://www.npmjs.com/package/web-terminal)

## Theory
What happens is we setup a terminal in the browser that can run your script and get output based on that. The scenarios know how to determine what was the last "output" of your cli.

## Dependencies
Install [phantom](http://phantomjs.org/) on your computer.

## Run the tests
Run the tests `npm test`

This boots up the web terminal in the background and kills it after the tests are over.
