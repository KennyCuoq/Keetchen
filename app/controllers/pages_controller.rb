class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout "layouts/layoutspecial", only:  :home
  def home
    # @customer = current_user.customer
    # @customer = Customer.find(custoner)
    # render :layout => 'layoutspecial'
  end
end
