require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(
      name: 'Test User',
      photo: 'photo.jpg',
      bio: 'Test bio',
      post_counter: 0
    )
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a negative post counter' do
    user = User.new(post_counter: -1)
    expect(user).to_not be_valid
  end

  describe '#recent_posts' do
    it 'returns 3 recent posts' do
      user = User.create(name: 'John Doe', bio: 'Im John Doe')
      Post.create(title: 'Post 1', text: 'Text 1', author: user)
      Post.create(title: 'Post 2', text: 'Text 2', author: user)
      Post.create(title: 'Post 3', text: 'Text 3', author: user)
      Post.create(title: 'Post 4', text: 'Text 4', author: user)

      recent_posts = user.recent_posts
      expect(recent_posts.count).to eq(3)
    end
  end
end
