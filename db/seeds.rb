# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
categories = [{ title: 'Ruby' },
              { title: 'Rails' },
              { title: 'OOP' },
              { title: 'JS' },
              { title: 'Vue' }]
tests =      [{ title: 'Introduction to Ruby', level: 0 },
              { title: 'Control Flow in Ruby', level: 0 },
              { title: 'Object-Oriented Programming, Part I', level: 1 },
              { title: 'Object-Oriented Programming, Part II', level: 1 },
              { title: 'Learn JavaScript: Introduction', level: 1 }]
questions =  [{ body: 'Ruby is a..?' },
              { body: 'OOP is a..?' }]
answers =    [{ title: 'object-oriented, dynamic' },
              { title: 'low-level programming language' },
              { title: 'server-side scripting language' },
              { title: 'imperative, object-oriented' },
              { title: 'Object-oriented programming' },
              { title: 'Order of play' },
              { title: 'Out of position' },
              { title: 'Some music group' }]
users =      [{ name: 'TestUser', age: 26 }]
Category.create categories
Answer.create answers
Question.create questions
Test.create tests
User.create users