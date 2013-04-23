SiteAdmin.TranslationsRoute = Ember.Route.extend
  model: -> SiteAdmin.Translation.find()

SiteAdmin.TranslationsEditRoute = SiteAdmin.ObjectRoute.extend()
SiteAdmin.TranslationsNewRoute = SiteAdmin.ObjectRoute.extend
  model: -> SiteAdmin.Translation.createRecord()