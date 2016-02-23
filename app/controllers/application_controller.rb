class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #authentication
  before_action :authenticate_user!

  skip_before_action :authenticate_user!, only: [:index, :show, :top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  


	protected
	def configure_permitted_parameters 
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
	  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, address_attributes: [:id, :state, :city, :address, :address2, :zipcode, :receiver, :phone] ) }
	end
end
