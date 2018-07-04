class User < ApplicationRecord
  has_and_belongs_to_many :tests
  def tests_with_level(level)
    Test.joins(:tests_users).where(level: level, tests_users: {user_id: id})
  end

  # def tests_with_level(level)
  #   Test.where(level: level, tests_users: {user_id: id})
  #
  #   2.4.1 :001 > user = User.first
  #   User Load (0.2ms)  SELECT  "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]
  #   => #<User id: 1, name: "User1", created_at: "2018-07-03 08:57:47", updated_at: "2018-07-03 08:57:47">
  #   2.4.1 :002 > user.tests_with_level 1
  #   Test Load (0.5ms)  SELECT  "tests".* FROM "tests" WHERE "tests"."level" = ? AND "tests_users"."user_id" = ? LIMIT ?  [["level", 1], ["user_id", 1], ["LIMIT", 11]]
  #   ActiveRecord::StatementInvalid: SQLite3::SQLException: no such column: tests_users.user_id: SELECT  "tests".* FROM "tests" WHERE "tests"."level" = ? AND "tests_users"."user_id" = ? LIMIT ?
  # end

end
