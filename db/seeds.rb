Order.destroy_all
#clean database
MealDate.destroy_all
Meal.destroy_all
User.destroy_all

# Creation of meals
pre_order_price = 450
day_price = 500

photo_burger = 'https://www.californiaavocado.com/getattachment/ac6fe491-1199-4df8-a725-3588383e997b/California-Avocado-Beef-and-Black-Bean-Burger'
photo_salad = 'https://cms.splendidtable.org/sites/default/files/styles/w2000/public/I-Love-India_Griddle-Chopped-Chicken-Salad-LEDE02.jpg?itok=qbUDcqvN'
photo_taboule = 'https://koken.medialaancdn.be/sites/koken.vtm.be/files/styles/vmmaplayer_big/public/recipe/image/istock_000017105352small.jpg?itok=9cmJMGfW'
photo_gnocchi = 'https://dusyefwqqyfwe.cloudfront.net/uploads/culinary/recipe_image/file/23814/recipe_card_size_6._Plate.jpg'
photo_poke = 'http://images.media-allrecipes.com/userphotos/960x960/4473416.jpg'
photo_beef_tartare = 'https://www.ribnreef.com/wp-content/uploads/2017/10/morceaux-de-boeuf-pour-tartare-2000x1200.jpg'

photo_dree = 'https://avatars0.githubusercontent.com/u/43139321?v=4'
photo_steven = 'https://avatars2.githubusercontent.com/u/41968309?v=4'
photo_kenny = 'https://avatars1.githubusercontent.com/u/26207944?v=4'
photo_frederik = 'https://avatars0.githubusercontent.com/u/43231640?v=4'
photo_inou = 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/yzmhkgececsz46relki9.jpg'
photo_ellyn = 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ul03dampdb9to6qumjcj.jpg'


gnocchi = Meal.create!(name: "Four Cheeses Gnocchi", description: "Smothered in a smooth and rich cheese sauce then grilled until golden and bubbling this delicious supper takes less than 30mins to cook. Potato gnocchi are small Italian dumplings that take just minutes to cook in boiling water. They have a fairly bland flavour but will absorb all the lovely flavours from the sauce.", photo: photo_gnocchi, pre_order_price_cents: pre_order_price, day_price_cents: day_price )
hamburger = Meal.create!(name: "Avocado Burger", description: "There’s nothing quite like fresh sliced avocado. It adds a light, creamy taste to whatever delicious food you decide add it to. And today we’re going to add it to a burger. The Avocado Burger is delicious and really easy to make. Just cutting up some avocado is a simple way to fancy up a burger anytime.", photo: photo_burger, pre_order_price_cents: pre_order_price, day_price_cents: day_price )
salad = Meal.create!(name: "Chicken Salad", description: "“Chaat” is a term used for a whole genre of streetfood which is hard to describe in one sentence, but one part of it encompasses a lot of simple vegetables and fruits tossed in some tangy and spiced lemon-based dressings with a blend of spices that are known as chaat masala. “Chaat” literally means to lick, as in finger-licking good… and they generally are. This chicken chaat is based on the one we ate growing up but we normally had it as a chopped salad, so everything mixes well with the tangy dressing.", photo: photo_salad, pre_order_price_cents: pre_order_price, day_price_cents: day_price )

taboule = Meal.create!(name: "Vegetable Taboulé", description: "Tabouli is likely the topmost famed Mediterranean/Middle Eastern salad there is. Because it is now sold in most large supermarkets around the world, I feel compelled to dispel one thing: the “star of the show,” so to speak, in a tabouli recipe is not the bulgur. The idea is to have a little bulgur with the salad, not a little salad with your bulgur.", photo: photo_taboule, pre_order_price_cents: pre_order_price, day_price_cents: day_price )
poke_bowl = Meal.create!(name: "Tuna Poke", description: "Created in the tropical Hawaiian islands, poké actually refers to the cubes of marinated raw fish that was a way to use up leftover ends from prime sashimi cuts.", photo: photo_poke, pre_order_price_cents: pre_order_price, day_price_cents: day_price )
beef_tartare = Meal.create!(name: "Beef Tartare", description: "Beef tartare is usually served with onions, capers, pepper and Worcestershire sauce, and other seasonings, often presented to the diner separately, to be added to taste. It is often served with a raw egg yolk, and often on rye bread.", photo: photo_beef_tartare, pre_order_price_cents: pre_order_price, day_price_cents: day_price )


meals = []
meals << gnocchi
meals << poke_bowl
meals << hamburger
meals << beef_tartare
meals << salad
meals << taboule

#creation of users
puts "Creating users..."
steven = User.create!(email: 'steven.vaneecke@gmail.com', password: "123456", first_name: "Steven", last_name: "Van Eecke")

kenny = User.create!(email: 'kenny.cuoq@gmail.com', password: "123456", first_name: "Kenny", last_name: "Cuoq")

frederik = User.create!(email: 'frederik.hossak@gmail.com', password: "123456", first_name: "Frederik", last_name: "Hossak")

dree = User.create!(email: 'andreasava@hotmail.com', password: "123456", first_name: "Andreas", last_name: "Van Assche")

inou = User.create!(email: 'inou.ridder@gmail.com', password: "123456", first_name: "Inou", last_name: "Ridder")

ellyn = User.create!(email: 'ellyn.bouscasse@gmail.com', password: "123456", first_name: "Ellyn", last_name: "Bouscasse")

users = []
users << steven
users << kenny
users << frederik
users << dree
users << inou
users << ellyn

admins = []
admins << steven
admins << kenny
admins << frederik
admins << dree

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
# #creation of orders
users.each do |user|
  meal_dates.each do |meal_date|
    if meal_date.date == Date.today
      order_price = 500
      pre = false
    else
      order_price = 450
      pre = true
    end
    qr = (0...26).map { ('a'..'z').to_a[rand(26)] }.join
    Order.create!(meal_date_id: meal_date.id, user_id: user.id, order_price_cents: order_price, pre_order: pre, qr_code: qr)
  end
end



#creation of customer profiles
Customer.destroy_all

users.each do |user|
  customer = Customer.new(user_id: user.id)
  case user.first_name
  when 'Steven'
    customer.remote_photo_url = photo_steven
  when 'Dree'
    customer.remote_photo_url = photo_dree
  when 'Kenny'
    customer.remote_photo_url = photo_kenny
  when 'Frederik'
    customer.remote_photo_url = photo_frederik
  when 'Inou'
    customer.remote_photo_url = photo_inou
  else
    customer.remote_photo_url = photo_ellyn
  end
  customer.save
end

#creation of employee profiles
Employee.destroy_all

admins.each do |admin|
  Employee.create!(user_id: admin.id, admin: true)
end


#creation of reviews
Review.destroy_all

meal_dates.each do |meal_date|
  users.each do |user|
  Review.create!(meal_date_id: meal_date.id, user_id: user.id, rating: rand(3..5))
  end
end













