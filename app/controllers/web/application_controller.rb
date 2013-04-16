class Web::ApplicationController < ApplicationController
  include FlashHelper
  include AuthHelper

  helper_method :current_user, :signed_in?
end
