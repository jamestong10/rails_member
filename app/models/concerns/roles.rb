module Roles
  extend ActiveSupport::Concern

  def grant(role)
    self.add_role(role) unless self.has_role?(role)
  end
  
  def refuse(role)
    self.remove_role(role) if self.has_role?(role)
  end
  
end