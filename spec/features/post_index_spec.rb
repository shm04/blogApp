require 'rails_helper'

RSpec.describe 'Post index page for a user', type: :feature do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, author: user) }
  let!(:comments) { create_list(:comment, 3, post: posts.first) }

  before do
    visit user_posts_path(user)
  end

  it 'shows all posts for the user' do
    posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text.truncate(100))
      expect(page).to have_content("Comments: #{post.comments.size}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end

  it 'redirects to post show page when clicking on a post title' do
    first_post = posts.first
    within("#post_#{first_post.id}") do
      click_link first_post.title
    end
    expect(current_path).to eq(user_post_path(user, first_post))
  end
end
