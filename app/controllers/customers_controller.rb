class CustomersController < ApplicationController
  mount_uploader :photo, PhotoUploader

  def show
    @customer = Customer.find(params[:id])
  end
end
