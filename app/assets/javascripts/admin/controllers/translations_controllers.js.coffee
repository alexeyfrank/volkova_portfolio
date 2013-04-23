SiteAdmin.TranslationsController = SiteAdmin.ArrayController.extend
  reloadTranslations: ->
    $.get(Routes.reload_api_translations_path()).success =>
      @flashSuccess "Переводы успешно перезагружены!"

SiteAdmin.TranslationsNewController = SiteAdmin.ObjectController.extend
  cancelRoute: 'translations'

SiteAdmin.TranslationsEditController = SiteAdmin.ObjectController.extend
  cancelRoute: 'translations'