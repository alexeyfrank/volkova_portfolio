SiteAdmin.Router.map ->
  @resource 'translations', ->
    @route 'new'
    @route 'edit', path: ':translation_id/edit'
