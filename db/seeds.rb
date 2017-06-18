# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  Project.create([{title: Faker::Book.title, description: Faker::Lorem.paragraphs, projType: 1},
                {title: Faker::Book.title, description: Faker::Lorem.paragraphs, projType: 0}])
end

User.create(name: "John Smith", email: "admin@admin.com", password: "password")
