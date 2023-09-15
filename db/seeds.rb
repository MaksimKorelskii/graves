# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  title = "Cemetery #{Faker::Lorem.word}"
  description = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  cemetery = Cemetery.create(title: title, description: description)
  rand(20...65).times do
    last_name = Faker::Name.last_name
    first_name = Faker::Name.first_name
    father_name = Faker::Name.middle_name
    birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    deathday = Faker::Date.in_date_period
    cemetery.graves.create(last_name: last_name, first_name: first_name, father_name: father_name,
                 birthday: birthday, deathday: deathday)
  end
end
