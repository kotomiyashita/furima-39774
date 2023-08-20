FactoryBot.define do
  factory :order_shippinginfo do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Lorem.sentence }
    address       { Faker::Lorem.sentence }
    building      { Faker::Lorem.sentence }
    phone_number  { Faker::Number.number(digits: rand(10..11)) }
  end
end
