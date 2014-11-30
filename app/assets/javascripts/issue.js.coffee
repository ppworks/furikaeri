$ ->
  issue = new Issue()

class Issue
  pusher: null
  constructor: ->
    @init()

  init: ->
    @listen()
    @listen_sortable()
    @listen_pusher()

  listen: ->
    $(document).on 'mouseover', '.issue__add-button', (e) ->
      $(e.target).parent().find('.hidden').show().find('input[type=text]').focus()

    $(document).on 'click', '.issue__add-button', (e) ->
      $issue__form__title = $(e.target)
      $issue__form = $issue__form__title.closest('.issue__form')
      unless $issue__form__title.val() == ''
        $issue__form.submit()

    $(document).on 'blur', '.issue__form__title', (e) ->
      $issue__form__title = $(e.target)
      $issue__form = $issue__form__title.closest('.issue__form')
      if $issue__form__title.val() == ''
        $issue__form.hide()

    $(document).on 'ajax::success', 'form.new_issue',  (data, textStatus, jqXHR)->
      @update_kpt_content()

    $(document).on 'ajax::success', 'a[data-method=delete]',  (data, textStatus, jqXHR)->
      @update_kpt_content()

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

  listen_pusher: ->
    @pusher = new Pusher(PUSHER_KEY,
      wsHost: PUSHER_HOST,
      enabledTransports: ["ws", "flash"],
      disabledTransports: ['flash'],
      authEndpoint: "#{location.pathname}/pusher_authentication",
      auth:
        headers:
          'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
    )
    if rack_env isnt 'production'
      Pusher.log = (message) ->
         console.log(message)

    channel = @pusher.subscribe('presence-furikaeri_' + location.pathname.replace('/', ''))
    channel.bind 'updated', (data) =>
      @update_kpt_content()

    channel.bind 'pusher:subscription_succeeded', (members) ->
      return

    channel.bind 'pusher:subscription_error', (data) ->
      return

  update_kpt_content: =>
    $.ajax
      url: location.pathname
      type: 'GET'
      cache: false
      success: (data) =>
        $('body').html($(data))
        @listen_sortable()
