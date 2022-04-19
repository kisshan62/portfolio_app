class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end
  
  private
    def sign_in_required
        redirect_to new_user_session_url unless user_signed_in?
    end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :profile, :avatar])
    end

    def configure_account_update_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile, :avatar])
    end
end
