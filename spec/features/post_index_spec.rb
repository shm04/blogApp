require 'rails_helper'

RSpec.describe 'Post index page for a user', type: :feature do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, author: user) }
  let!(:comments) { create_list(:comment, 3, user: user, post: posts.first) }
  include ActionView::Helpers::AssetUrlHelper
  before do
    visit user_posts_path(user)
  end

  it 'displays user information' do
    expect(page).to have_selector("img[src*='tom']")
    expect(page).to have_css(".user-info .user-name", text: user.name)
    expect(page).to have_content("Number of posts: #{user.post_counter}")
  end

  it 'displays posts information' do
    posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text.truncate(100))
      expect(page).to have_content("Comments: #{post.comments.size}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end

  it 'displays the first comments on a post' do
    posts.each do |post|
      post.recent_comments.each do |comment|
        expect(page).to have_content("#{comment.user.name}: #{comment.text}")
      end
    end
  end

  it 'displays how many comments and likes a post has' do
    posts.each do |post|
      expect(page).to have_content("Comments: #{post.comments.size}")
      expect(page).to have_content("Likes: #{post.likes.size}")
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
