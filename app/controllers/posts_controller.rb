class PostsController < ApplicationController
  def index
    @topic = Topic.find_by(id: params[:topic_id])
    posts = @topic.posts
    comments = posts.map(&:comments)
    @posts_with_comments = posts.zip(comments)
  end

  def edit
    @topic = Topic.find_by(id: params[:topic_id])
  	@post = Post.find_by(id: params[:id])
  	render :edit
  end

  def create
    topic = Topic.find_by(id: params[:topic_id])
    post = Post.create(title: params[:post][:title], content: params[:post][:content], topic: topic)
    if post.valid?
      redirect_to :back
    end
  end

  def update
  	post = Post.find_by(id: params[:id])
  	if post.update_attributes(title: params[:post][:title], content: params[:post][:content])
  		redirect_to :back
  	else
  		render :edit
  	end
  end

  def destroy
  	Post.find_by(id: params[:id]).destroy
  	redirect_to :back
  end
end
