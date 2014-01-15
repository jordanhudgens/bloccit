# fix for the image uploading and name function
class Users::RegistrationsController < Devise::RegistrationsController

    before_filter :configure_permitted_parameters
    def update
            # required for settings form to submit when password is left blank
        if params[:user][:password].blank?
          params[:user].delete("password")
          params[:user].delete("password_confirmation")
        end

        @user = User.find(current_user.id)
        
        # you NEED to create a user_params function for this
        # to work in Rails 4
        if @user.update_attributes(user_params)
          set_flash_message :notice, :updated
          # Sign in the user bypassing validation in case his password changed
          sign_in @user, :bypass => true
          redirect_to after_update_path_for(@user)
        else
          render "devise/registrations/edit"
        end
    end

    protected

    # custom name fields
    def configure_permitted_parameters
        # needed syntax so default params are not overridden
        devise_parameter_sanitizer.for(:account_update) << :name << :avatar
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :avatar, :email_favorites)
    end
end
