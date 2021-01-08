FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name                  {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    #password              {Faker::Internet.password(min_length: 6)}
    password              {"abc123"}
    password_confirmation {password}
    first_name_z          {person.first.kanji}
    last_name_z           {person.last.kanji}
    first_name_k          {person.first.katakana}
    last_name_k           {person.last.katakana}
    birthday              {Faker::Date.between(from: 2.days.ago, to: Date.today)}
  end
end