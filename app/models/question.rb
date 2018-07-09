# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true

  scope :correct, -> { where(correct: true).order(created_at: :desc) }
end
