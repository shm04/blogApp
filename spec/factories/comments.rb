FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    user { association(:user) }
    post { association(:post) }
  end
end