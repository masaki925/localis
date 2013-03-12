class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to new_user_request_path(current_user) if current_user.has_role? :guest
    end
  end
end
