class UserPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def upgrade_primium?
    @current_user.id == @user.id
  end
end