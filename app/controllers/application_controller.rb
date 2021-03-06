class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admins_genres_path
    else
      user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :user
      new_user_session_path
    else
      new_admin_session_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
