class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    render controller: :posts, action: :index
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
