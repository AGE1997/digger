class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:last_name, :first_name, :pseudonym_last_name, :pseudonym_first_name,
                                             :telephone_number])
  end

  def set_search
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true)
  end
end
