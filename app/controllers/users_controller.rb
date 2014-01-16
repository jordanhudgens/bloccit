class UsersController < ApplicationController

  # for user profiles
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end

end
