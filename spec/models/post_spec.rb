require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(
      name: 'Test User',
      photo: 'photo.jpg',
      bio: 'Test bio',
      post_counter: 0
    )
    post = Post.new(
      author: user,
      title: 'Test Post',
      text: 'Test post text',
      comments_counter: 0,
      likes_counter: 0
    )
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    user = User.create(
      name: 'Test User',
      photo: 'photo.jpg',
      bio: 'Test bio',
      post_counter: 0
    )
    post = Post.new(author: user, title: nil)
    expect(post).to_not be_valid
  end

  it 'is not valid with a long title' do
    user = User.create(
      name: 'Test User',
      photo: 'photo.jpg',
      bio: 'Test bio',
      post_counter: 0
    )
    post = Post.new(author: user, title: 'A' * 251)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative comments counter' do
    user = User.create(
      name: 'Test User',
      photo: 'photo.jpg',
      bio: 'Test bio',
      post_counter: 0
    )
    post = Post.new(author: user, title: 'Test Post', comments_counter: -1)
    expect(post).to_not be_valid
  end

  it 'is not valid with a negative likes counter' do
    user = User.create(
      name: 'Test User',
      photo: 'photo.jpg',
      bio: 'Test bio',
      post_counter: 0
    )
    post = Post.new(author: user, title: 'Test Post', likes_counter: -1)
    expect(post).to_not be_valid
  end

  describe '#update_user_posts_counter' do
    it 'increments the author\'s posts_counter when a post is saved' do
      user = User.create(name: 'John', post_counter: 0)
      post = Post.new(title: 'Test Post', comments_counter: 0, likes_counter: 0, author: user)

      expect do
        post.save
        user.reload
      end.to change(user, :post_counter).by(1)
    end
  end

  describe '#recent_comments' do
    it 'show 5 last comments' do
      user = User.create(name: 'John Doe', bio: 'I am John')
      post = Post.create(title: 'title 1', text: 'text 1', author: user)
      7.times { Comment.create(user:, post:, text: 'Some text') }

      recent_comments = post.recent_comments
      expect(recent_comments.count).to eq(5)
    end
  end
end
