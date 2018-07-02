# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create [{ name: 'User1' }, { name: 'User2' }]
tests = Test.create [{ title: 'Test1', level: 0 },
                     { title: 'Test2' },
                     { title: 'Test3' }]

TestsUsers.create [{ user_id: users[0].id, test_id: tests[0].id },
                      { user_id: users[1].id, test_id: tests[1].id },
                      { user_id: users[0].id, test_id: tests[2].id }]
