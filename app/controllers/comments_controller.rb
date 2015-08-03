class CommentsController < ApplicationController
  def edit
  	@post = Post.find_by(id: params[:post_id])
  	@comment = Comment.find_by(id: params[:id])
  end

  def create
  	comment = Comment.create(content: params[:comment][:content], post_id: params[:post_id])
  	if comment.valid?
  		redirect_to root_path
  	end
  end

  def update
  	comment = Comment.find_by(id: params[:id])
  	if comment.update_attributes(content: params[:comment][:content])
  		redirect_to root_path
  	else
  		render :edit
  	end
  end

  def destroy
  	Comment.find_by(id: params[:id]).destroy
  	redirect_to root_path
  end
end
