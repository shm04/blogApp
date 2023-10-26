require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      name: 'Test User',
      photo: 'photo.jpg',
      bio: 'Test bio',
      post_counter: 0
    )
    post = Post.create(
      author: user,
      title: 'Test Post',
      text: 'Test post text',
      comments_counter: 0,
      likes_counter: 0
    )
    like = Like.new(user:, post:)
    expect(like).to be_valid
  end
end
