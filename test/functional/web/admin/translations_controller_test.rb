require 'test_helper'

class Web::Admin::TranslationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
