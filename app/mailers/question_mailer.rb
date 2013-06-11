# encoding: utf-8

class QuestionMailer < ActionMailer::Base
  default from: "noreply@mdmstandart.ru"

  def new_question(question, get_catalog)
    @question = question
    if get_catalog
      attachments['catalog.pdf'] = File.read(Rails.root + '/public/catalog.pdf')
    end
    mail to: configus.admin_email, subject: 'Оставлен новый вопрос'
  end
end
