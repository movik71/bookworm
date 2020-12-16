# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Word.any?
  apple = Word.create!(text: "Яблоко")
  cat = Word.create!(text: "Кот")
  tree = Word.create!(text: "Дерево")
end

unless Enemy.any?
  first_enemy = Enemy.create!(name: "Первый враг", hp: 100)
  second_enemy = Enemy.create!(name: "Второй враг", hp: 300)
  third_enemy = Enemy.create!(name: "Третий враг", hp: 700)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?