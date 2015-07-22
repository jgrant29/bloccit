class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    autorize @comment
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @comment.save

    redirect_to [@topic, @post]
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

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
