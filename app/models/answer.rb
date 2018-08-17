class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :validate_answers_count

  scope :correct, -> { where(correct: true).order(created_at: :desc) }

  def validate_answers_count
    errors.add(:question_id, 'must have 1..4 answers') unless question.answers.count.between?(0, 4)
  end
end
