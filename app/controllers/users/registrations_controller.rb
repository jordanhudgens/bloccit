# fix for the image uploading and name function
class Users::RegistrationsController < Devise::RegistrationsController

    before_filter :configure_permitted_parameters

    protected

    # custom name fields
    def configure_permitted_parameters
        # needed syntax so default params are not overridden
        devise_parameter_sanitizer.for(:account_update) << :name << :avatar
    end
end
