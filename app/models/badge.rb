class Badge < ApplicationRecord
  BADGE_RULES = ['all_tests_in_level', 'all_tests_in_category', 'first_try'].freeze

  has_many :user_badges
  has_many :users, through: :user_badges


end
