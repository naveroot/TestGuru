class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  # before_validation :before_validation_set_first_question, on: :create

  before_save :before_save_set_next_question


  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    # self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def success_result
    correct_questions.to_f / test.questions.count * 100
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_save_set_next_question
    self.current_question = next_question
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if current_question.nil?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end

  end


end
