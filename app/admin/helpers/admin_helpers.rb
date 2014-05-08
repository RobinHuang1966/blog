module ActiveAdmin::ViewHelpers

  def link_to_clone(resource)
    resource_name = resource.class.name.downcase
    resource_ref = "#{resource_name}_id"
    path = "new_admin_#{resource_name}_path"
    link_to('clone', send(path, resource_ref => resource.id))
  end

end
