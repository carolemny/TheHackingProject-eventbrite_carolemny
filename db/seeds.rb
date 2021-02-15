# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Creation des Users

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true), encrypted_password: "password", email: Faker::Internet.email(domain: 'yopmail.com'))
end

2.times do
  Event.create(start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 60), duration: Faker::Number.number(digits: 10), title: Faker::Lorem.characters, description: Faker::Lorem.characters, price: Faker::Number.within(range: 1..1000), location: Faker::Address.city, user_id: 1)
end

5.times do 
  Attendance.create(stripe_customer_id: "stringtest", user_id: 1, event_id: 1)
end