class SummariesController < ApplicationController

  def show
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @summary = current_user.summaries.build(params.require(:post).permit(:name, :description))
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post.  Please try again."
      render :new
    end 
  end
  
  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
   end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

      if @post.update_attributes(params.require(:post).permit(:title, :body))
       flash[:notice] = "Post was updated."
       redirect_to [@topic, @post]
     else
       scope.where(user: user)
    end
  end
end
