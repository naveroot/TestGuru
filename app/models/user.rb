# frozen_string_literal: true
require 'digest/sha1'

class User < ApplicationRecord
  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  has_secure_password

  def tests_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test)
  end

#   def authenticate(password_string)
#     digest(password_string) == password_digest ? self : false
#   end
#
#   def password=(password_string)
#     if password_string.nil?
#       self.password_digest = nil
#     elsif password_string.present?
#       @password = password_string
#       self.password_digest = digest(password_string)
#     end
#   end
#
#   private
#
#   def digest(string)
#     Digest::SHA1.hexdigest(string)
#   end
#
end
