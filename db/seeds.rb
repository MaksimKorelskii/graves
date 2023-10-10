# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
15.times do
  name = Faker::Lorem.word.capitalize
  email = "#{Faker::Lorem.word.capitalize}@example.com"
  User.create(email: email,
              name: name,
              password: email,
              password_confirmation: email)
end

10.times do
  title = "Cemetery #{Faker::Lorem.word.capitalize}"
  description = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  cemetery = Cemetery.create(title:, description:, user_id: User.last.id)
  rand(20...65).times do
    last_name = Faker::Name.last_name
    first_name = Faker::Name.first_name
    father_name = Faker::Name.middle_name
    birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    deathday = Faker::Date.in_date_period
    cemetery.graves.create(last_name:, first_name:, father_name:,
                           birthday:, deathday:, user_id: User.last.id)
  end
end
