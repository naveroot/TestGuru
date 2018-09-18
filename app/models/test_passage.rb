class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_next_question
  before_save :before_save_set_success

  scope :by_user, ->(user) {where(user_id: user.id)}
  scope :success, ->{ where(success: true) }

  delegate :category, to: :test, prefix: true

  def stop!
    self.current_question = nil
  end

  def time_left
    (expires_at - Time.current).to_i
  end

  def time_over?
    expires_at < Time.current
  end

  def time_remaning
    if check_timer
      stop!
    else
      accept!(params[:answer_ids])
    end
  end


  def accept!(answers_ids)
    self.correct_questions += 1 if correct_answer?(answers_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def points
    correct_questions.to_f / questions_count * 100
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def questions_count
    test.questions.count
  end

  def success?
    points >= 85
  end


  private

  def check_timer
    test.timer_exists? && time_over?
  end

  def expires_at
    created_at + test.timer.minutes
  end

  def before_save_set_success
    self.success = success?
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
