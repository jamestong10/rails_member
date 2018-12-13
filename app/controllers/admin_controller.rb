class AdminController < ActionController::Base
  before_action :signed_in?
  before_action :is_admin?

  private

  def signed_in?
    unless user_signed_in?
      flash[:notice] = "Please Login"
      redirect_to root_path
    end
  end
  
  def is_admin?
    unless current_user.has_role?(:admin)
      flash[:notice] = "You are not a admin"
      redirect_to root_path
    end
  end
end