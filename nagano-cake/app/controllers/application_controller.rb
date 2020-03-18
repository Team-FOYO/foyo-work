class ApplicationController < ActionController::Base

	case resource
	when Admin
		new_admin_session_path
	when User
		new_user_session_path
	end
end
