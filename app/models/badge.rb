# frozen_string_literal: true

class Badge < ApplicationRecord
  BADGE_RULES = %i[all_tests_in_level all_tests_in_category first_try].freeze
  BADGE_IMAGES = %w(hanukkat.png privateinvestocat.jpg mcefeeline.jpg).freeze

  validates :title, uniqueness: true

  has_many :user_badges
  has_many :users, through: :user_badges, dependent: :destroy
  belongs_to :category, optional: true, dependent: :destroy
end
