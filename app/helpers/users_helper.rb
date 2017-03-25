module UsersHelper
  def human_roles_form_collection
    User.roles.keys.map{|role| [role, User.human_attribute_name(role)]}
  end
end
