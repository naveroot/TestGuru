# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# users = User.create! [{ name: 'User1', email: 'test@test.ru' }, { name: 'User2', email: 'test1@test.ru' }]
Admin.create email: "test@test.ru",
             first_name: "Иван",
             last_name: "Пупкин",
             encrypted_password: "$2a$11$QxWue1wSaqm5/QSIk/Oz/uEgyIUxXvmfUeoNFMBCMXwuVci4tOkXy"

categories = Category.create! [{ title: 'JS' },
                               { title: 'Ruby' },
                               { title: '1C' },
                               { title: 'Go' }]

tests = Test.create! [{ title: 'Тестовые задания по теме "Объекты конфигурации системы "1С:Предприятие 8"',
                        level: 0,
                        category_id: categories[2].id,
                        author: Admin.first}]


questions = Question.create! [{ body: 'Главный инструмент разработчика информационной системы на базе 1С',  test_id: tests[0].id },
                              { body: 'Логические единицы, составляющие конфигурацию системы 1С:',  test_id: tests[0].id },
                              { body: 'Объект конфигурации, предназначенный для работы со списками данных',  test_id: tests[0].id },
                              { body: 'Является прикладным и предназначен для описания информации о совершенных хозяйственных операциях или о событиях, произошедших в жизни организации',  test_id: tests[0].id },
                              { body: 'Объект конфигурации, являющийся прикладным и предназначенный для описания структуры аккумулирования данных',  test_id: tests[0].id },
                              { body: 'Виды числовой информации, накапливаемой регистром накопления, называются',  test_id: tests[0].id },
                              { body: 'Объект конфигурации, являющийся прикладным и предназначенный для описания алгоритмов, при помощи которых пользователь сможет получать необходимые ему выходные данные',  test_id: tests[0].id },
                              { body: 'Объект конфигурации, являющийся прикладным и предназначенный для описания структуры хранения данных в разрезе нескольких измерений',  test_id: tests[0].id },
                              { body: 'Являются основными элементами интерфейса, т.к. образуют разделы прикладного решения',  test_id: tests[0].id },
                              { body: 'Назначением данного объекта является аккумулирование числовой информации в разрезе нескольких измерений',  test_id: tests[0].id }]

answers = Answer.create! [{ title: 'Платформа',                         question_id: questions[0].id },
                          { title: 'Прикладное решение',                question_id: questions[0].id },
                          { title: 'Конфигуратор',                      question_id: questions[0].id },
                          { title: 'Объекты конфигурации',              question_id: questions[1].id },
                          { title: 'Элементы формы приложения',         question_id: questions[1].id },
                          { title: 'Составляющие части платформы',      question_id: questions[1].id },
                          { title: 'Справочник',                        question_id: questions[2].id },
                          { title: 'Документ',                          question_id: questions[2].id },
                          { title: 'Регистр накопления ',               question_id: questions[2].id },
                          { title: 'Отчет',                             question_id: questions[2].id },
                          { title: 'Справочник',                        question_id: questions[3].id },
                          { title: 'Документ',                          question_id: questions[3].id },
                          { title: 'Регистр накопления ',               question_id: questions[3].id },
                          { title: 'Перечисление',                      question_id: questions[3].id },
                          { title: 'Справочник',                        question_id: questions[4].id },
                          { title: 'Документ',                          question_id: questions[4].id },
                          { title: 'Регистр накопления',                question_id: questions[4].id },
                          { title: 'Перечисление',                      question_id: questions[4].id },
                          { title: 'Элементами макета',                 question_id: questions[5].id },
                          { title: 'Элементами справочника',            question_id: questions[5].id },
                          { title: 'Ресурсами',                         question_id: questions[5].id },
                          { title: 'Реквизитами',                       question_id: questions[5].id },
                          { title: 'Справочник',                        question_id: questions[6].id },
                          { title: 'Документ',                          question_id: questions[6].id },
                          { title: 'Регистр накопления',                question_id: questions[6].id },
                          { title: 'Отчет',                             question_id: questions[6].id },
                          { title: 'Регистр сведений',                  question_id: questions[7].id },
                          { title: 'Регистр накоплений',                question_id: questions[7].id },
                          { title: 'Макет',                             question_id: questions[7].id },
                          { title: 'Отчет',                             question_id: questions[7].id },
                          { title: 'Подсистемы',                        question_id: questions[8].id },
                          { title: 'Макеты',                            question_id: questions[8].id },
                          { title: 'Меню конфигурации',                 question_id: questions[8].id },
                          { title: 'Панель навигации',                  question_id: questions[8].id },
                          { title: 'регистр накопления',                question_id: questions[9].id },
                          { title: 'регистр сведений',                  question_id: questions[9].id },
                          { title: 'отчет',                             question_id: questions[9].id },
                          { title: 'журнал документов',                 question_id: questions[9].id }]