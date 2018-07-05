class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.by_category(category)
    joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
