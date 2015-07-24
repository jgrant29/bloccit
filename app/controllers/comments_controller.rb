class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @comment.save

    redirect_to [@post.topic, @post]
    # authorize @post
    # if @post.save
      # flash[:notice] = "Post was saved"
      # redirect_to [@topic, @post]
    # else
      # flash[:error] = "There was an error saving the post.  Please try again."
      # render :new
    # end 
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted.  Try again."
      redirect_to [@post.topic, @post]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
