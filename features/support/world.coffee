spawn = require('child_process').spawn

WorldConstructor = (callback) ->

  class World

    process: null

    output: []

    runCommand: (command, callback) =>
      command = command.split(' ')
      @waitForOutput(callback)
      @process = spawn(
        command[0],
        command.slice(1),
        cwd: "#{__dirname}/../../"
      )
      @process.stdout.on 'data', (data) =>
        @output.push data.toString()

    type: (input, callback) =>
      @waitForOutput(callback)
      @process.stdin.write "#{input}\n"

    waitForOutput: (callback) =>
      @_waitForOutput(@output.length, callback)

    # Subtract 2
    # 1 for index to count
    # 1 account for the new prompt it sends
    getOutput: (callback) =>
      callback(@output[@output.length - 2])

    _waitForOutput: (oldOutputLength, callback) =>
      if @output.length > oldOutputLength
        callback()
      else
        setTimeout(@_waitForOutput.bind(@, oldOutputLength, callback), 500)

  callback(new World)

exports.World = WorldConstructor
