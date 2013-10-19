class RegistrationsController < Devise::RegistrationsController
	

	def create
		super
		resource.update_attributes(:role => sign_up_params[:role])
	end


	protected

	def after_sign_up_path_for(resource)
		if current_user.role == "photog"
			photographer_path(resource.profile)
		else
			profile_path(resource.profile)
		end
	end

end
