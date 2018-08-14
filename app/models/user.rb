class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  # has_many :tests_users
  # has_many :tests, through: :tests_users

  has_many :authored_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true, uniqueness: true

  def tests_with_level(level)
    tests.where(level: level)
  end
end
