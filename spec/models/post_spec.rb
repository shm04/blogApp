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
end
