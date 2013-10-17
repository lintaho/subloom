class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_filter do
	  resource = controller_name.singularize.to_sym
	  method = "#{resource}_params"
	  params[resource] &&= send(method) if respond_to?(method, true)
	end



  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  def after_sign_in_path_for(resource)
    # debugger
    request.env['omniauth.origin'] || stored_location_for(resource) || profile_path(resource.profile)
  end

  # def after_sign_up_path_for(resource)
  
 #  end

end
