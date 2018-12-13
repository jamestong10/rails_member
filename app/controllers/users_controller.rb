class UsersController < ApplicationController
  rescue_from Pundit::NotAuthorizedError, with: :not_the_same_user

  def upgrade_premium
    @user = User.find(params[:id])
    authorize @user
    @user.add_role(:premium)
    redirect_to root_path
  end

  private

  def not_the_same_user
    flash[:notice] = "You can not upgrade to premium."
    redirect_to root_path
  end
end
