# frozen_string_literal: true

FactoryBot.define do
  factory :grave do
    last_name { 'Smith' }
    first_name { 'Jack ' }
    father_name { 'Alex' }
    birthday { '1980-01-01' }
    deathday { '2015-09-12' }

    trait :invalid do
      last_name { nil }
      first_name { 'Jack ' }
      father_name { 'Alex' }
      birthday { '1980-01-01' }
      deathday { '2015-09-12' }
    end
  end
end
