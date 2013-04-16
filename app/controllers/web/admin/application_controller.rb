class Web::Admin::ApplicationController < Web::ApplicationController
  before_filter :authenticate_user!
end
