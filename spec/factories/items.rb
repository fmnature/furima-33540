FactoryBot.define do
  factory :item do
    title                 {"abc123"}
    text                  {"aaaaaa"}
    price                 {300}
    category_id           {2}
    state_id              {2}
    burden_id             {2}
    area_id               {2}
    days_id               {2}
    user_id               {2}
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/konoha.png'), filename: 'konoha.png', content_type: 'image/png')
    end
  end
end
