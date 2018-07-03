class User < ApplicationRecord
  has_and_belongs_to_many :tests
  def tests_with_level(level)
    Test.joins(:tests_users).where(level: level, tests_users: {user_id: id})
  end
end
