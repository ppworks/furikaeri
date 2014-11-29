$ ->
  common = new Common

class Common
  constructor: ->
    @init()

  init: ->
    @listen()

  listen: ->
    $(document).on 'mouseover', '.js-show', (e) ->
      $(e.target).parent().find('.hidden').show().find('input[type=text]').focus()
