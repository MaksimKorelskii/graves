FactoryBot.define do
  factory :grave do
    last_name { "MyString" }
    first_name { "MyString" }
    father_name { "MyString" }
    birthday { "2023-09-12" }
    deathday { "2023-09-12" }
    cemetery { nil }
  end
end
