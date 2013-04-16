require 'test_helper'

class Web::Admin::PagesControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
    @page = create :page
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
    get :edit, id: @page.slug
    assert_response :success
  end

  test "should post :create" do
    attrs = attributes_for :page
    post :create, page: attrs
    assert_response :redirect
    page = Page.find_by_slug attrs[:slug]
    assert page
  end

  test "should put :update" do
    attrs = attributes_for :page
    put :update, id: @page.slug, page: attrs
    assert_response :redirect
    page = Page.find_by_title attrs[:title]
    assert page == @page
  end

  test "should delete :destroy" do
    delete :destroy, id: @page.slug
    assert_response :redirect
    assert !Page.exists?(@page)
  end

end
