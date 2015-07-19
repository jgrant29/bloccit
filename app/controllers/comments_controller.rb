class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params.[:id])
    @comment = current_user.comments.build(comment_params)
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
