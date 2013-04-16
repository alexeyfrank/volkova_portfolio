require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
  end

  test "should get :index" do
    get :index
    assert_response :success
  end

  test "should get :new" do
    get :new
    assert_response :success
  end

  test "should get :edit" do
    get :edit, id: @user.id
    assert_response :success
  end

  test "should post :create" do
    attrs = attributes_for :user
    post :create, user: attrs
    assert_response :redirect
    user = User.find_by_email attrs[:email]
    assert user
  end

  test "should put :update" do
    attrs = attributes_for :user
    put :update, id: @user.id, user: attrs
    assert_response :redirect
    user = User.find_by_email attrs[:email]
    assert user == @user
  end

  test "should delete :destroy" do
    delete :destroy, id: @user.id
    assert_response :redirect
    assert !User.exists?(@user)
  end
end
