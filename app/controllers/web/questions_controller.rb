class Web::QuestionsController < Web::ApplicationController

  def new
    @question = Web::QuestionEditType.new
  end

  def create
    @question = Web::QuestionEditType.new params[:question]
    @get_catalog = params[:get_catalog]
    if @question.save
      QuestionMailer.new_question(@question, @get_catalog).deliver
      flash_success
      redirect_to params[:from] || root_path
    else
      flash_error
      render :new
    end
  end
end
