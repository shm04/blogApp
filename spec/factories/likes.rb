FactoryBot.define do
  factory :like do
    author_id { create(:user).id }
    post
  end
end
