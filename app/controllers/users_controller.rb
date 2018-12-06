class UsersController < ApplicationController
  def upgrade_primium
    @user = User.find(params[:id])
    @user.add_role(:premium)
    redirect_to root_path
  end
end
