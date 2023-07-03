FactoryBot.define do
  factory :kaimono do
    postal_code     { '123-4567' } 
    region_id       { 1 } 
    city            { '渋谷区' } 
    house_number    { '1-2-3' } 
    phone_number    { '09012345678' } 
    user_id         { 1 } 
    item_id         { 1 } 
  end
end
