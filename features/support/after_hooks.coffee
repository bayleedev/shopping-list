module.exports = ->
  @After (callback) ->
    @browser.exit()
    callback()
