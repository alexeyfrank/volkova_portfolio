SiteAdmin.ArrayController = Ember.ArrayController.extend
  needs: [ 'application' ]

  flashSuccess: (msg) ->
    @get('controllers.application').set('flashSuccess', msg)
  flashError: (msg) ->
    @get('controllers.application').set('flashError', msg)
