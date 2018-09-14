# frozen_string_literal: true

class Badge < ApplicationRecord
  BADGE_RULES = %i[all_tests_in_level all_tests_in_category first_try].freeze
  BADGE_IMAGES = %w(hanukkat.png privateinvestocat.jpg mcefeeline.jpg).freeze

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges


  validates :title, uniqueness: true

  scope :by_title, ->(title) { where(title: title) }

  enum rule: BADGE_RULES
end
