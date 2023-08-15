FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'aaa000' }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '隆太郎' }
    family_name_kana      { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    date_of_birth         { '2000-01-01' }
  end
end
