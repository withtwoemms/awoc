class CommentsController < ApplicationController
  def edit
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
  end

  def create
    topic = Topic.find_by(id: params[:topic_id])
    post = Post.find_by(id: params[:post_id])
    comment = Comment.create(content: params[:comment][:content], post: post)
    if comment.valid?
      redirect_to topic_posts_path( topic )
    end
  end

  def update
    topic = Topic.find_by(id: params[:topic_id])
    post = Post.find_by(id: params[:post_id])
  	comment = Comment.find_by(id: params[:id])
  	if comment.update_attributes(content: params[:comment][:content])
  		redirect_to topic_posts_path( topic )
  	else
  		render :edit
  	end
  end

  def destroy
  	Comment.find_by(id: params[:id]).destroy
  	redirect_to :back
  end
end
