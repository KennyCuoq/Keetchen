Order.destroy_all
#clean database
MealDate.destroy_all
Meal.destroy_all
User.destroy_all

# Creation of meals
pre_order_price = 500
day_price = 450

photo_burger = 'https://www.californiaavocado.com/getattachment/ac6fe491-1199-4df8-a725-3588383e997b/California-Avocado-Beef-and-Black-Bean-Burger'
photo_salad = 'https://cms.splendidtable.org/sites/default/files/styles/w2000/public/I-Love-India_Griddle-Chopped-Chicken-Salad-LEDE02.jpg?itok=qbUDcqvN'
photo_taboule = 'https://koken.medialaancdn.be/sites/koken.vtm.be/files/styles/vmmaplayer_big/public/recipe/image/istock_000017105352small.jpg?itok=9cmJMGfW'



hamburger = Meal.create!(name: "Avocado Burger", description: "There’s nothing quite like fresh sliced avocado. It adds a light, creamy taste to whatever delicious food you decide add it to. And today we’re going to add it to a burger. The Avocado Burger is delicious and really easy to make. Just cutting up some avocado is a simple way to fancy up a burger anytime.", photo: photo_burger, pre_order_price_cents: pre_order_price, day_price_cents: day_price )
salad = Meal.create!(name: "Chicken Salad", description: "“Chaat” is a term used for a whole genre of streetfood which is hard to describe in one sentence, but one part of it encompasses a lot of simple vegetables and fruits tossed in some tangy and spiced lemon-based dressings with a blend of spices that are known as chaat masala. “Chaat” literally means to lick, as in finger-licking good… and they generally are. This chicken chaat is based on the one we ate growing up but we normally had it as a chopped salad, so everything mixes well with the tangy dressing.", photo: photo_salad, pre_order_price_cents: pre_order_price, day_price_cents: day_price )

taboule = Meal.create!(name: "Vegetable Taboulé", description: "Tabouli is likely the topmost famed Mediterranean/Middle Eastern salad there is. Because it is now sold in most large supermarkets around the world, I feel compelled to dispel one thing: the “star of the show,” so to speak, in a tabouli recipe is not the bulgur. The idea is to have a little bulgur with the salad, not a little salad with your bulgur.", photo: photo_taboule, pre_order_price_cents: pre_order_price, day_price_cents: day_price )

meals = []
meals << hamburger
meals << salad
meals << taboule

#creation of users
puts "Creating users..."
steven = User.create!(email: 'steven.vaneecke@gmail.com', password: "Steven", first_name: "Steven", last_name: "Van Eecke")

kenny = User.create!(email: 'kenny.cuoq@gmail.com', password: "KennyKenny", first_name: "Kenny", last_name: "Cuoq")

frederik = User.create!(email: 'frederik.hossak@gmail.com', password: "Frederik", first_name: "Frederik", last_name: "Hossak")

dree = User.create!(email: 'andreasava@hotmail.com', password: "DreeDree", first_name: "Andreas", last_name: "Van Assche")

users = []
users << steven
users << kenny
users << frederik
users << dree

#creation of meal_dates
counter = 0
today = Date.today
meal_dates = []
meals.each do |meal|
  new_meal_date = MealDate.create!(date: (today + counter), meal_id: meal.id )
  counter += 1
  meal_dates << new_meal_date
end

p users
p meal_dates
# creation of orders
users.each do |user|
  meal_dates.each do |meal_date|
    if meal_date.date == Date.today
      order_price = 500
      pre = false
    else
      order_price = 450
      pre = true
    end
    Order.create!(meal_date_id: meal_date.id, user_id: user.id, order_price_cents: order_price, pre_order: pre)
  end
end

#creation of customer profiles
Customer.destroy_all

users.each do |user|
  Customer.create!(user_id: user.id)
end

#creation of employee profiles
Employee.destroy_all

users.each do |user|
  Employee.create!(user_id: user.id, admin: true)
end

#creation of reviews
Review.destroy_all

meal_dates.each do |meal_date|
  users.each do |user|
  Review.create!(meal_date_id: meal_date.id, user_id: user.id, rating: rand(3..5))
  end
end










