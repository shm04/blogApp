class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def set_user
    @user = User.includes(posts: :comments).find(params[:id])
  end
end
