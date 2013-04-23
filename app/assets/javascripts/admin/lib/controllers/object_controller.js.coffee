SiteAdmin.ObjectController = Ember.ObjectController.extend
  needs: [ 'application' ]

  cancelRoute: null

  flashSuccess: (msg) ->
    @get('controllers.application').set('flashSuccess', msg)
  flashError: (msg) ->
    @get('controllers.application').set('flashError', msg)

  # Save object
  save: ->
    @store.commit()
    @flashSuccess("Запись успешно сохранена!")

  # Cancel object editing
  cancel: ->
    if @content.get('isNew')
      @content.deleteRecord()

    if @cancelRoute
      @transitionToRoute @cancelRoute

    @flashSuccess("Произошла отмена действия!")

  destroy: ->
    @content.deleteRecord()
    @store.commit()
    @transitionToRoute @cancelRoute
    @flashSuccess("Запись успешно удалена!")
