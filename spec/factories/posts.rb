FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    text { 'This is a test post.' }
    author { create(:user) }
  end
end
