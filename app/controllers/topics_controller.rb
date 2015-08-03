class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    render controller: :posts, action: :index
  end

  def edit
    @topic = Topic.find_by(id: params[:id])
    render :edit
  end

  def create
    topic = Topic.create(title: params[:topic][:title], description: params[:topic][:description])
    if topic.valid?
      redirect_to :back
    end
  end

  def update
    topic = Topic.find_by(id: params[:id])
    if topic.update_attributes(title: params[:topic][:title], description: params[:topic][:description])
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Topic.find_by(id: params[:id]).destroy
    redirect_to :back
  end
end
