FactoryBot.define do
  factory :item do
    title                 {"abc123"}
    text                  {"aaaaaa"}
    price                 {300}
    genre_id           {2}
    state_id              {2}
    burden_id             {2}
    area_id               {2}
    day_id               {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/konoha.png'), filename: 'konoha.png', content_type: 'image/png')
    end
  end
end
