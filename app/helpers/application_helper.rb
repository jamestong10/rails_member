module ApplicationHelper
  def is_admin?
    current_user.has_role?(:admin)
  end

  def is_vip?
    current_user.has_role?(:vip)
  end
end
