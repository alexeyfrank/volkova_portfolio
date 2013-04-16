# encoding: utf-8

class QuestionMailer < ActionMailer::Base
  default from: "noreply@mdmstandart.ru"

  def new_question(question)
    @question = question
    mail to: configus.admin_email, subject: 'Оставлен новый вопрос'
  end
end
