# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :gists
  belongs_to :test

  validates :body, presence: true
end
