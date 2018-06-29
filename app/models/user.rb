class User < ApplicationRecord
  has_many :completed_test
  has_many :tests, through: :completed_tests

  def tests_with_level(level)

  end
end
