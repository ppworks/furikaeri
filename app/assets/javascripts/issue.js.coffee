$ ->
  issue = new Issue()

class Issue
  constructor: ->
    @init()

  init: ->
    @listen()

  listen: ->
    $(document).on 'mouseover', '.issue__add-button', (e) ->
      $(e.target).parent().find('.hidden').show().find('input[type=text]').focus()

    $(document).on 'blur', '.issue__form__title', (e) ->
      $issue__form__title = $(e.target)
      $issue__form = $issue__form__title.closest('.issue__form')
      if $issue__form__title.val() == ''
        $issue__form.hide()
      else
        $issue__form.find('form').submit()
