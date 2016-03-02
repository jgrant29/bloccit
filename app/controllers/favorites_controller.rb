class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite

    if favorite.save
      flash[:notice] = "\"#{post.title}\" was added to our mailing list and your Bookmark tab"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error saving favorite.  Please try again."
      redirect_to [post.topic, post]
    end  
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])
    authorize favorite

    if favorite.destroy
      flash[:notice] = "Favorite \"#{post.title}\" was sucessfully deleted"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error saving favorite.  Please try again."
      redirect_to [post.topic, post]
    end
  end
end