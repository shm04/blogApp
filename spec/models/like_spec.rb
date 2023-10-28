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

  describe '#update_post_likes_counter' do
    it 'increments the post\'s likes_counter when a like is created' do
      user = User.create(name: 'John', post_counter: 0)
      post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)

      like = Like.new(post:, user:)
      like.save

      post.reload

      expect(post.likes_counter).to eq(1)
    end
  end
end
