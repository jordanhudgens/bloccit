class ApplicationController < ActionController::Base
    include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # rescue from permissions details
  rescue_from Pundit::NotAuthorizedError do |exception|
      redirect_to root_url, alert: exception.message
  end

  # customize the page that users see when they sign in
  def after_sign_in_path_for(resource)
      topics_path
  end

end
