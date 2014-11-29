$ ->
  notice_message = new NoticeMessage()

class NoticeMessage
  constructor: ->
    @init()

  init: ->
    @listen()

  listen: ->
    timeout_id = setTimeout ->
      $('#flash_notice').html('')
      $('.alert-success').animate({height: 0, padding: 0}, 400, 'swing', ->
        $('.alert-success').remove() if rails_env isnt 'test'
      )
    , 2000
