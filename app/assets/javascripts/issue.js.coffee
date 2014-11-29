$ ->
  issue = new Issue()

class Issue
  constructor: ->
    @init()

  init: ->
    @listen()
    @listen_sortable()

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

  listen_sortable: ->
    $("ul.issue__list").sortable({
      connectWith: ".issue__list"
      receive: (e, ui) ->
        handle_change(e, ui, @)
      update: (e, ui) ->
        handle_change(e, ui, @)
    }).disableSelection()

    handle_change = (e, ui, ref) ->
      $item  = $(ui.item)
      $ref   = $(ref)
      params = { _method: 'put' }
      params[$item.data().modelName] =
        priority_position: $item.index()
        status: $ref.data().status
      $.ajax
        url: $item.data().updateUrl
        type: 'POST'
        dataType: 'json'
        data: params
      return
