module ApplicationHelper
  def is_admin?
    current_user.has_role?(:admin)
  end

  def is_premium?
    current_user.has_role?(:premium)
  end
end
