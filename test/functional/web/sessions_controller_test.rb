require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user.activate
  end

  test "should get :new" do
    get :new
    assert_response :success
  end

  test "should post :create" do
    attrs = { email: @user.email, password: 'secret' }
    post :create, web_user_sign_in_type: attrs
    assert_response :redirect
    assert signed_in?
  end

  test "should delete :destroy" do
    delete :destroy
    assert_response :redirect
    assert !signed_in?
  end
end
