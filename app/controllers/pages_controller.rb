class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout "layouts/layoutspecial", only:  :home
  def home
    # render :layout => 'layoutspecial'
  end
end
