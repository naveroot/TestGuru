class User < ApplicationRecord
  has_many :tests
  def finished_test_by_level(level)
  end
end
