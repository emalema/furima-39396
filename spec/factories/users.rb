FactoryBot.define do
  factory :user do
    transient do
      gimei_name { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { gimei_name.first.kanji }
    last_name             { gimei_name.last.kanji }
    first_name_kana       { gimei_name.first.katakana }
    last_name_kana        { gimei_name.last.katakana }
    date_of_birth         { Faker::Date.birthday }
  end
end
