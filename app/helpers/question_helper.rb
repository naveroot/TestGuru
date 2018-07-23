module QuestionHelper
  def question_header(question)
    edit_message = "Редактировать вопрос: #{question.body}"
    new_message = "Создать новый вопрос для теста #{question.test.title}"
    question.persisted? ?  edit_message : new_message
  end
end
