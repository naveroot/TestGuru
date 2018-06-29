class Test < ApplicationRecord
  has_many :completed_test
  has_many :users, through: :completed_tests
end
