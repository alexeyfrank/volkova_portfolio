class Web::Admin::QuestionsController < Web::Admin::ApplicationController
  def index
    @search = Question.ransack params[:q]
    @questions = @search.result.admin.page(params[:page]).per(20)
  end

  def show
    @question = Question.find params[:id]
  end
end
