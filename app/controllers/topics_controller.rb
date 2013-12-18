class TopicsController < ApplicationController
  def index
      @topics = Topic.all
  end

  def new
      @topic = Topic.new
      authorize @topic
  end

  def edit
      @topic = Topic.find(params[:id])
      authorize @topic
  end

  def show
      @post = Post.find(params[:id])
      @topic = Topic.find(params[:topic_id])
  end

  def create
      @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
      authorize @topic
      if @topic.save
          flash[:notice] = "Topic was saved successfully."
          redirect_to @topic
      else
          flash[:error] = "Error creating topic.  Please try again."
          render :new
      end
  end

  def update
      @topic = Topic.find(params[:id])
      authorize @topic
      if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
          redirect_to @topic
      else
          flash[:error] = "Error saving topic.  Please try again"
          render :edit
      end
  end
end
