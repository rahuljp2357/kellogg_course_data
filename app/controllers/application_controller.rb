class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[user_first_name
                                               user_second_name class_of])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[user_first_name
                                               user_second_name class_of])
  end
end
