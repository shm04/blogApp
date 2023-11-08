require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'test_user') }
  let(:post) { Post.create(title: 'Test Post', author: user) }
  let!(:comment1) { Comment.create(text: 'This is a test post comment 1', post:) }
  let!(:comment2) { Comment.create(text: 'This is a test post comment 2', post:) }

  describe 'GET /users/:user_id/posts' do
    it 'returns a 200 OK status' do
      get user_posts_path(user)
      expect(response).to have_http_status(200)
    end

    it "renders the 'index' template" do
      get user_posts_path(user)
      expect(response).to render_template('index')
    end

    it 'includes the correct placeholder text in the response body' do
      get user_posts_path(user)
      expect(response.body).to include(user.name)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns a 200 OK status' do
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
    end

    it "renders the 'show' template" do
      get user_post_path(user, post)
      expect(response).to render_template('show')
    end

    it 'includes the correct placeholder text in the response body' do
      get user_post_path(user, post)
      expect(response.body).to include(post.title)
    end
  end
end
