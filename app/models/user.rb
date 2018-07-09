class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  validates :email, presence: true, uniqueness: true

  def tests_with_level(level)
    tests.where(level: level)
  end
end
