# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :user_badges
  has_many :badges, through: :user_badges
  has_many :gists
  has_many :feedbacks

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, uniqueness: true

  def tests_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

  def admin?
    is_a? Admin
  end

  def has_badge?(badge)
    badges.include? badge
  end

  def get_user_badges_hash
    user_badges = {}
    badges_titles = badges.map(&:title).uniq
    badges_titles.each do |badge_title|
      user_badges[badge_title.to_sym] = { count: badges.by_title(badge_title).count,
                                          image: badges.by_title(badge_title).first.badge_image }
    end
    user_badges
  end
end
