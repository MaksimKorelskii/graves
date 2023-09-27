# frozen_string_literal: true

FactoryBot.define do
  sequence :title do |n|
    "Cemetery #{n}"
  end

  factory :cemetery do
    title
    description { 'Some description' }

    trait :invalid do
      title { '' }
    end
  end
end
