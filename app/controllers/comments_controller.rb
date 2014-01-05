class CommentsController < ApplicationController

  def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.find(params[:post_id])
      @comments = @post.comments

      @comment = current_user.comments.build(comment_params)
      @comment.post = @post

      authorize @comment

      if @comment.save
          flash[:notice] = "Comment was saved"
          redirect_to @topic
      else
          flash[:error] = "There was an error saving the comment, please try again"
          render :new
      end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
