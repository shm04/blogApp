FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { 'tom.jpg' }
    bio { Faker::Lorem.paragraph }
    post_counter { 0 }

    trait :with_posts do
      after :create do |user|
        create_list(:post, 3, author: user)
      end
    end

    trait :with_comments do
      after :create do |user|
        create_list(:comment, 3, author: user)
      end
    end
  end
end