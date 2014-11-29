$ ->
  return unless $('body').hasClass('project-new')
  project_new = new ProjectNew()

class ProjectNew
  constructor: ->
    @init()

  init: ->
    $('.project__form__name').focus()
    @listen()

  listen: ->
