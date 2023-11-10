require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:users) { create_list(:user, 3, photo: 'tom.jpg') }

  before do
    visit users_path
  end

  it 'displays user information and post count' do
    users.each do |user|
      expect(page).to have_selector("img[src*='tom']")
      expect(page).to have_content(user.name)
      expect(page).to have_content("Number of Posts: #{user.posts.size}")
    end
  end

  it 'redirects to user show page when clicking on a user' do
    first_user = users.first
    within("#user_#{first_user.id}") do
      click_link first_user.name
    end
    expect(current_path).to eq(user_path(first_user))
  end
end
