class Web::ApplicationController < ApplicationController
  include FlashHelper
  include AuthHelper

  helper_method :current_user, :signed_in?

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale

  end

  def default_url_options
    { locale: I18n.locale }
  end
end
