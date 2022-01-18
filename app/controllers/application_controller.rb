class ApplicationController < ActionController::Base
  layout :layout_admin_session

  protected

    def layout_admin_session
      if devise_controller? && resource_class == Admin
          "layout_session"
      else
          "application"
      end
    end

end
