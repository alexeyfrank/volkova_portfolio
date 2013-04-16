require 'test_helper'

class Web::Admin::QuestionsControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    sign_in @user
    @question = create :question
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @question.id
    assert_response :success
  end

end
