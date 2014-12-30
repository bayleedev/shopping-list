prompt = require('cli-input')

class Prompt

  list: null

  ps: null

  constructor: ->
    @list = new ShoppingList
    @ps = prompt
      infinite: false,
      format: '> '
    @ps.on('value', @handler)

  handler: ([command, arg]) =>
    @list[command](arg) if @list[command]
    if command == 'exit'
      @ps.readline.close()
    else
      @open()

  open: ->
    @ps.run()

class ShoppingList

  shopping_list: []

  list: ->
    console.log i, el for el,i in @shopping_list

  add: (item) ->
    @shopping_list.push(item)

  remove: (item) ->
    @shopping_list.splice(@shopping_list.indexOf(item), 1)

new Prompt().open()
