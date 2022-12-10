class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new(parent_id: params[:parent_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.new(comments_params.merge(user_id: current_user.id))
    @comments.save
    redirect_to posts_path      
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    @comments.destroy
    redirect_to post_path(@post)
  end

  private
  
  def comments_params
    params.require(:comment).permit(:post_id , :user_id, :description)
  end
end
