FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthdate             { Faker::Date.birthday(min_age: 18, max_age: 65) }
    family_name           { "あ" }
    first_name            { "あ" }
    family_name_pron      { "ア" }
    first_name_pron       { "ア" }

  end
end