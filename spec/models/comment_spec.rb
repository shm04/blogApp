require 'rails_helper'

RSpec.describe Comment, type: :model do
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
    comment = Comment.new(user:, post:, text: 'Test comment')
    expect(comment).to be_valid
  end

  it 'is not valid without text' do
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
    comment = Comment.new(user:, post:, text: '')
    expect(comment).to_not be_valid
  end

  describe '#update_user_posts_counter' do
    it 'updates the post\'s comments_counter when a comment is saved' do
      user = User.create(name: 'John', post_counter: 0)
      post = Post.create(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)

      comment = Comment.new(text: 'Test comment', post:, user:)
      expect do
        comment.save
        post.reload
      end.to change(post, :comments_counter).by(1)
    end
  end
end
