require 'rails_helper'
RSpec.describe 'User show page', type: :feature do
  let(:user) { create(:user) }
  let!(:posts) do
    create_list(:post, 3, author: user)
  end
  before do
    visit user_path(user)
  end
  it 'shows the user profile with their posts' do
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.size}")
    user.recent_posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content("Comments: #{post.comments.size}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end
  it 'redirects to the user posts index page when clicking see all posts' do
    click_link 'See all Posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
