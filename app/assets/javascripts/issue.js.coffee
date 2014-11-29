$ ->
  issue = new Issue()

class Issue
  constructor: ->
    @init()

  init: ->
    @listen()

  listen: ->
    $(document).on 'blur', '#issue_title', (e) ->
      $(e.target).closest('.hidden').hide()
