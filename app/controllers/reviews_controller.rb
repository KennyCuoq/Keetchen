class ReviewsController < ApplicationController
  def create

    rating = params[:num_stars]
    @meal_date = MealDate.find(params[:meal_date_id])
    @review = Review.new

    @review.rating = rating
    @review.user = current_user
    @review.meal_date = @meal_date
    @review.save

    @customer = current_user.customer.id

    redirect_to my_orders_customer_path(@customer)
  end
end

