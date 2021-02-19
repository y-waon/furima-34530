FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.free_email}
      password              {Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      first_name            {person.first.kanji}
      last_name             {person.last.kanji}
      first_katakana        {person.first.katakana}
      last_katakana         {person.last.katakana}
      birthday              {'2001-09-23'}
  end
end