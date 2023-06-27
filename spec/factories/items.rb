FactoryBot.define do
  factory :item do
    item_name              { Faker::Name.name }
    item_detail            { Faker::Name.name }
    category_id            { 2 }
    condition_id           { 2 }
    cost_id                { 2 }
    region_id              { 2 }
    howmanydays_id         { 2 }
    price                  { Faker::Number.between(from: 300, to: 9_999_999) }
    image { Rack::Test::UploadedFile.new('public/test_image.png', 'image/png') }
  end
end
