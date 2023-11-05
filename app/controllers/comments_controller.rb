class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = @post.author
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:success] = 'Comment created successfully.'
      redirect_to user_post_path(@user, @post)
    else
      flash[:error] = 'Comment could not be created.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
