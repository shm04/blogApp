FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    author { association(:user) }
  end
  trait :with_comments do
    after :create do |post|
      create_list(:comment, 3, post:)
    end
  end
end