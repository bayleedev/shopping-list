terminalStepDefinitions = ->
  @World = require("../support/world").World

  @Given 'I open the shopping list', (callback) ->
    @visit "http://localhost:8088/terminal", =>
      @type "coffee index.coffee", callback

  @When /^I type in "([^"]*)"$/, (command, callback) ->
    @type command, callback

  @Then /^I should see "([0-9]*)" items on the list$/, (count, callback) ->
    @getOutput (result) ->
      result_count = result.trim().split('\n').length
      if result_count isnt parseInt(count, 10)
        callback.fail new Error("Expected to find #{count} lines but got #{result_count}.")
      else
        callback()

  @Then /^I should see "([^"]*)" in the output$/, (phrase, callback) ->
    @getOutput (result) ->
      if result.indexOf(phrase) is -1
        callback.fail new Error("Expected to find #{phrase} in #{result}.")
      else
        callback()

  @Then /^I should not see "([^"]*)" in the output$/, (phrase, callback) ->
    @getOutput (result) ->
      if result.indexOf(phrase) isnt -1
        callback.fail new Error("Expected to not find #{phrase} in #{result}.")
      else
        callback()

module.exports = terminalStepDefinitions
