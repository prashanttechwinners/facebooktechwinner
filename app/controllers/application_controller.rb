class ApplicationController < ActionController::Base
	 before_action :authenticate_user!
	
	def after_sign_in_path_for(resourse)
		profile_index_path
	end

	def after_sign_out_path_for(resourse)
		new_user_session_path
	end
	skip_before_action :verify_authenticity_token
end
