class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    post = Post.create(title: params[:post][:title], content: params[:post][:content])
    if post.valid?
      redirect_to action: :index
    end
  end
end
