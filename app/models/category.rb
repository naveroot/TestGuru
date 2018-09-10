class Category < ApplicationRecord
  default_scope { order(title: :asc) }

  has_many :tests
  has_many :badges
end
