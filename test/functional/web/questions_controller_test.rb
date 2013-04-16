require 'test_helper'

class Web::QuestionsControllerTest < ActionController::TestCase
  test 'should get :new' do
    get :new
    assert_response :success
  end

  test 'should post :create' do
    attrs = attributes_for :question
    post :create, question: attrs
    assert_response :redirect
    question = Question.find_by_email attrs[:email]
    assert question
  end
end
