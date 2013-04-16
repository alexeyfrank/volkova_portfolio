class Web::QuestionsController < Web::ApplicationController

  def new
    @question = Web::QuestionEditType.new
  end

  def create
    @question = Web::QuestionEditType.new params[:question]
    if @question.save
      QuestionMailer.new_question(@question).deliver
      flash_success
      redirect_to params[:from] || root_path
    else
      flash_error
      render :new
    end
  end
end
