# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validate :validate_answers_count
  scope :correct, -> { where(correct: true).order(created_at: :desc) }


  def validate_answers_count
    errors.add(:question_id, 'must have 1..4 answers') unless answers.count.between?(1, 4)
  end
end
