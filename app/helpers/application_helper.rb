module ApplicationHelper
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def current_path
        Rails.application.routes.recognize_path(request.fullpath)
    end
end
