# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create! [{ name: 'User1', email: 'test@test.ru' }, { name: 'User2', email: 'test1@test.ru' }]

categories = Category.create! [{ title: 'JS' },
                               { title: 'Ruby' },
                               { title: 'Go' }]

tests = Test.create! [{ title: 'Test1', level: 0, category_id: categories[0].id, author: users[0]},
                      { title: 'Test2', level: 1, category_id: categories[1].id, author: users[1]},
                      { title: 'Test3', level: 2, category_id: categories[2].id, author: users[0]}]


TestsUser.create! [{ user_id: users[0].id,  test_id: tests[0].id, status: 'in_progress' },
                    { user_id: users[1].id,  test_id: tests[1].id, status: 'finished' },
                    { user_id: users[0].id,  test_id: tests[2].id }]

questions = Question.create! [{ body: 'test_question_1',  test_id: tests[0].id },
                              { body: 'test_question_2',  test_id: tests[1].id },
                              { body: 'test_question_3',  test_id: tests[2].id }]

answers = Answer.create! [{ title: 'test_answer_1', question_id: questions[0].id },
                          { title: 'test_answer_2', question_id: questions[0].id },
                          { title: 'test_answer_3', question_id: questions[0].id },
                          { title: 'test_answer_2', question_id: questions[0].id },
                          { title: 'test_answer_2', question_id: questions[1].id },
                          { title: 'test_answer_2', question_id: questions[1].id },
                          { title: 'test_answer_2', question_id: questions[2].id } ]