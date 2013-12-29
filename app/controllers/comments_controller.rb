class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(params[:comment])
    @comment.post = @post
    

  authorize! :create, @comment, message: "You need to be signed up to do that."
  if @post.save
    flash[:notice] = "Comment was created."
    redirect_to [@topic, @post]
  else
    flash[:error] = "There was an error saving the comment. Please try again."
    render :new
  end
  end
end
