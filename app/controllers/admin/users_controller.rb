class Admin::UsersController < AdminController
  before_action :set_user, only: [:approve, :disapprove]

  def index
    @users = User.all
  end

  def approve
    @user.grant(:admin)
    redirect_to admin_users_path
  end
  
  def disapprove
    @user.refuse(:admin)
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
