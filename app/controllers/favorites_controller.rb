class FavoritesController < ApplicationController

    before_filter :authenticate_user!

    def create
        @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.find(params[:post_id])

        authorize Favorite.new

        favorite = current_user.favorites.create(post: @post)

        if favorite.valid?
            flash[:notice] = "Favorited post"
            redirect_to [@topic, @post]
        else
            flash[:error] = "Unable to add favorite, please try again"
            redirect_to [@topic, @post]
        end
    end

    def destroy
        @topic = Topic.find(params[:topic_id])
        @post = @topic.posts.find(params[:post_id])
        @favorite = current_user.favorites.find(params[:id])

        authorize @favorite

        if @favorite.destroy
            flash[:notice] = "Removed favorite"
            redirect_to [@topic, @post]
        else
            flash[:error] = "Unable to remove favorite.  Please try again"
            redirect_to [@topic, @post]
        end
    end

end
