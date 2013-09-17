class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

	def current_user

		if !@current_user
			@current_user = User.find(session[:user_id]) if session[:user_id]	
		end
		# says if current user is nill do this else do nothing
    	# @current_user ||= User.find(session[:user_id]) if session[:user_id]
    	rescue
    		@current_user = nil
    		session[:user_id] = nil
		end

  		helper_method :current_user

end

# in the show
# <%= formatted_price @product.price %>