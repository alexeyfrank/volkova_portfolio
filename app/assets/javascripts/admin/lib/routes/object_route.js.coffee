SiteAdmin.ObjectRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', model
