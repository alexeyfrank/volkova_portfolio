require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  setup do
    @page = create :page, slug: :main
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
