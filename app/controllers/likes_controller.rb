class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @like = @post.likes.build(like_params)
  
      if @like.save
        flash[:success] = 'Liked post!'
      else
        flash[:error] = 'Failed to like post.'
      end
  
      redirect_to user_post_path(@post.author, @post)
    end
  
    def destroy
      @like = Like.find(params[:id])
      @post = @like.post
  
      if @like.destroy
        flash[:success] = 'Unliked post.'
      else
        flash[:error] = 'Failed to unlike post.'
      end
  
      redirect_to user_post_path(@post.author, @post)
    end
  
    private
  
    def like_params
      params.require(:like).permit(:user_id)
    end
  end