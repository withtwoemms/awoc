class CommentsController < ApplicationController
  def edit
  end

  def create
  	comment = Comment.create(content: params[:comment][:content], post_id: params[:post_id])
  	if comment.valid?
  		redirect_to root_path
  	end
  end

  def update
  end

  def destroy
  end
end
