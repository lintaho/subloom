class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
 	protect_from_forgery with: :exception
	before_filter :store_location
	before_filter :configure_permitted_parameters, if: :devise_controller?	
	before_filter do
		resource = controller_name.singularize.to_sym
		method = "#{resource}_params"
		params[resource] &&= send(method) if respond_to?(method, true)
	end

	def store_location
	 if (!request.fullpath.match("/users/") &&
		!request.xhr?) # don't store ajax calls
		session[:previous_url] = request.fullpath
	 end
	end


	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end


	def after_sign_in_path_for(resource)
		request.env['omniauth.origin'] || session[:previous_url] 
		# || stored_location_for(resource) 
		# || profile_path(resource.profile)
	end

	def after_sign_up_path_for(resource)
		#not getting hit
		root_path
	end

	def configure_permitted_parameters
	    devise_parameter_sanitizer.for(:sign_up) << :role
	end

end
