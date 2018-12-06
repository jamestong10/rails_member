class AdminController < ActionController::Base
  before_action :signed_in?
  before_action :is_admin?

  private

  def signed_in?
    redirect_to root_path unless user_signed_in?
  end
  
  def is_admin?
    redirect_to root_path unless current_user.has_role?(:admin)
  end
end