# require 'rails_helper'

# RSpec.describe 'Users', type: :request do
#   describe 'GET /users' do
#     it 'returns a 200 OK status' do
#       get users_path
#       expect(response).to have_http_status(200)
#     end

#     it "renders the 'index' template" do
#       get users_path
#       expect(response).to render_template('index')
#     end

#     it 'includes the correct placeholder text in the response body' do
#       get users_path
#       expect(response.body).to include('<ul class="users-list">')
#     end
#   end

#   describe 'GET /users/:id' do
#     let(:user) { User.create(name: 'test_user', bio: 'user_bio') }

#     it 'returns a 200 OK status' do
#       get user_path(user)
#       expect(response).to have_http_status(200)
#     end

#     it "renders the 'show' template" do
#       get user_path(user)
#       expect(response).to render_template('show')
#     end

#     it 'includes the correct placeholder text in the response body' do
#       get user_path(user)
#       expect(response.body).to include(user.bio)
#     end
#   end
# end
