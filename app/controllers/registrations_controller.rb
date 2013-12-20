# fix for the image uploading and name function
class Users::RegistrationsControllers < Devise::RegistrationsController

    before_filter :configure_permitted_parameters

    protected

    # custom name fields
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:update) do |u|
            u.permit(:name, :avatar)
        end
    end
end
