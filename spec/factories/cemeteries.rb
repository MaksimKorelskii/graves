# frozen_string_literal: true

FactoryBot.define do
  sequence :title do |n|
    "Cemetery #{n}"
  end

  factory :cemetery do
    title
    description { 'Some description' }

    trait :invalid_title_nil do
      title { nil }
    end

    trait :invalid_title_short do
      title { '< 5' }
    end

    trait :invalid_title_long do
      title { 'Title is too long, more than 50 symbols, 
               title is too long, more than 50 symbols' }
    end
  end
end
