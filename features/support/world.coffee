phantom = require("phantom")

WorldConstructor = (callback) ->

  class World

    phantom: phantom

    browser: null

    page: null

    visit: (url, callback) =>
      phantom.create (@browser) =>
        @browser.createPage (@page) =>
          @page.open "http://localhost:8088/terminal", (status) =>
            callback()

    getOutput: (callback) =>
      @page.evaluate ->
        window.APP.output[window.APP.output.length - 2]
      , (result) ->
        callback(result)

    type: (input, callback) =>
      for i in [0...input.length]
        @_typeCharCode(input.charCodeAt(i))
      @waitForOutput(callback)
      @_typeCharCode(13) # Enter

    # Wait for bigger output length window.APP.output.length
    waitForOutput: (callback) =>
      @page.evaluate ->
        window.APP.output.length
      , (result) =>
        @_waitFor (callback) =>
          @page.evaluate (result) ->
            result < window.APP.output.length
          , callback, result
        , ->
          callback()

    _typeCharCode: (code, callback = (p) -> p) =>
      @page.evaluate (code) ->
        jQuery("#cursor").trigger(jQuery.Event("keypress",
          which: code
        ))
      , callback, code

    _waitFor: (test, callback, timeOutMillis = 4500) =>
      start = new Date().getTime()
      condition = false
      interval = setInterval =>
        if (new Date().getTime() - start < timeOutMillis) and not condition
          test (result) ->
            condition = result
        else
          callback(condition)
          clearInterval interval
      , 250

  callback(new World)

exports.World = WorldConstructor
