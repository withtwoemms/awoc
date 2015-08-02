class PostsController < ApplicationController
  def index
    posts = Post.all
    comments = posts.map(&:comments)
    @posts_with_comments = posts.zip(comments)
  end

  def edit
  	@post = Post.find_by(id: params[:id])
  	render :edit
  end

  def create
    post = Post.create(title: params[:post][:title], content: params[:post][:content])
    if post.valid?
      redirect_to root_path
    end
  end

  def update
  	post = Post.find_by(id: params[:id])
  	if post.update_attributes(title: params[:post][:title], content: params[:post][:content])
  		redirect_to root_path
  	else
  		render :edit
  	end
  end

  def destroy
  	Post.find_by(id: params[:id]).destroy
  	redirect_to root_path
  end
end
