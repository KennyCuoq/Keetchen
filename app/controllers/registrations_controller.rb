class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    customer_path(resource.customer.id)
  end

end
