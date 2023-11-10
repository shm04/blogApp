require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 5, author: user) }

  before do
    visit user_path(user)
  end

  it 'displays the user profile with their first 3 posts' do
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.size}")

    user.recent_posts.take(3).each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content("Comments: #{post.comments.size}")
      expect(page).to have_content("Likes: #{post.likes_counter}")
    end
  end

  it 'displays a button to view all of a user\'s posts' do
    expect(page).to have_link('See all Posts', href: user_posts_path(user))
  end

  it 'redirects to the user posts index page when clicking "See all Posts"' do
    click_link 'See all Posts'
    expect(current_path).to eq(user_posts_path(user))
  end

  it 'redirects to the post show page when clicking on a user\'s post' do
    first_post = user.recent_posts.first
    within("#post_#{first_post.id}") do
      click_link first_post.title
    end
    expect(current_path).to eq(user_post_path(user, first_post))
  end
end
