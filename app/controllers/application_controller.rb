class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :categories, :brands

  def categories
  	@categories = Category.order(:name)
  end

  def brands
  	@brands = Product.pluck(:brand).sort.uniq!
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      "#{ENV['other_url']}"
    else
      request.remote_ip
    end
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation, :role) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :role) }
  end
end
