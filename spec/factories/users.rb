FactoryBot.define do
  factory :user do
    gimei = Gimei.name

    nickname              {Faker::Name.initials(number: 2)}
    last_name             { 'あア' + gimei.last.kanji}
    first_name            { 'あア' + gimei.first.kanji}
    last_name_kana        {gimei.last.katakana}
    first_name_kana       {gimei.first.katakana}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: 5.year.ago)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
  end
end
