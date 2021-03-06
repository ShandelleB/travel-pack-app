class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_filter :categories
  
  protected
  
   def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, 
   :password_confirmation, :role) }

  devise_parameter_sanitizer.for(:account_update) { |u| u.permit({ roles: [] }, :email, :password, 
  :password_confirmation, :current_password, :role) }
 end
 
  def categories
    products = Product.all
    @categories = []
    
    products.each do |product|
      unless @categories.include?(product.category)
        @categories.push(product.category)
      end
    end
    return @categories
  end
end
