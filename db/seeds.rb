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
photo_pad_thai = 'https://pinchofyum.com/wp-content/uploads/Vegetarian-Pad-Tha-2-2.jpg'
photo_pesto_pasta = 'https://images.pexels.com/photos/1256875/pexels-photo-1256875.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'

photo_dree = 'https://avatars0.githubusercontent.com/u/43139321?v=4'
photo_steven = 'https://avatars2.githubusercontent.com/u/41968309?v=4'
photo_kenny = 'https://avatars1.githubusercontent.com/u/26207944?v=4'
photo_frederik = 'https://avatars0.githubusercontent.com/u/43231640?v=4'
photo_inou = 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/yzmhkgececsz46relki9.jpg'
photo_ellyn = 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/ul03dampdb9to6qumjcj.jpg'
photo_dharam = 'https://avatars3.githubusercontent.com/u/28381425?v=4'
photo_elijah = 'https://avatars2.githubusercontent.com/u/1316776?v=4'
photo_hilmar = 'https://avatars0.githubusercontent.com/u/43231640?v=4'
photo_jethro = 'https://avatars3.githubusercontent.com/u/35604636?v=4'
photo_john = 'https://avatars2.githubusercontent.com/u/93381?v=4'
photo_jonas = 'https://avatars2.githubusercontent.com/u/43283863?v=4'
photo_jules = 'https://avatars2.githubusercontent.com/u/38872895?v=4'
photo_merlin = 'https://avatars3.githubusercontent.com/u/40541966?v=4'
photo_owain = 'https://avatars0.githubusercontent.com/u/23619296?v=4'
photo_paul = 'https://avatars1.githubusercontent.com/u/43411286?v=4'
photo_roger = 'https://avatars0.githubusercontent.com/u/23165579?v=4'
photo_shawkat = 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/rkifvnfts1c76wqsbrqh.jpg'
photo_stephen = 'https://avatars2.githubusercontent.com/u/41954899?v=4'
photo_victor = 'https://avatars1.githubusercontent.com/u/42962239?v=4'
photo_william = 'https://avatars3.githubusercontent.com/u/27657581?v=4'


gnocchi = Meal.new(name: "Four Cheeses Gnocchi", description: "Smothered in a smooth and rich cheese sauce then grilled until golden and bubbling this delicious supper takes less than 30mins to cook. Potato gnocchi are small Italian dumplings that take just minutes to cook in boiling water. They have a fairly bland flavour but will absorb all the lovely flavours from the sauce.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
gnocchi.remote_photo_url =  photo_gnocchi
gnocchi.save
hamburger = Meal.new(name: "Avocado Burger", description: "There’s nothing quite like fresh sliced avocado. It adds a light, creamy taste to whatever delicious food you decide add it to. And today we’re going to add it to a burger. The Avocado Burger is delicious and really easy to make. Just cutting up some avocado is a simple way to fancy up a burger anytime.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
hamburger.remote_photo_url =  photo_burger
hamburger.save
salad = Meal.new(name: "Chicken Salad", description: "“Chaat” is a term used for a whole genre of streetfood which is hard to describe in one sentence, but one part of it encompasses a lot of simple vegetables and fruits tossed in some tangy and spiced lemon-based dressings with a blend of spices that are known as chaat masala. “Chaat” literally means to lick, as in finger-licking good… and they generally are. This chicken chaat is based on the one we ate growing up but we normally had it as a chopped salad, so everything mixes well with the tangy dressing.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
salad.remote_photo_url =  photo_salad
salad.save
taboule = Meal.new(name: "Vegetable Taboulé", description: "Tabouli is likely the topmost famed Mediterranean/Middle Eastern salad there is. Because it is now sold in most large supermarkets around the world, I feel compelled to dispel one thing: the “star of the show,” so to speak, in a tabouli recipe is not the bulgur. The idea is to have a little bulgur with the salad, not a little salad with your bulgur.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
taboule.remote_photo_url =  photo_taboule
taboule.save
poke_bowl = Meal.new(name: "Tuna Poke", description: "Created in the tropical Hawaiian islands, poké actually refers to the cubes of marinated raw fish that was a way to use up leftover ends from prime sashimi cuts.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
poke_bowl.remote_photo_url =  photo_poke
poke_bowl.save
beef_tartare = Meal.new(name: "Beef Tartare", description: "Beef tartare is usually served with onions, capers, pepper and Worcestershire sauce, and other seasonings, often presented to the diner separately, to be added to taste. It is often served with a raw egg yolk, and often on rye bread.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
beef_tartare.remote_photo_url =  photo_beef_tartare
beef_tartare.save
pad_thai = Meal.new(name: "Vegetarian Pad Thai", description: "In Thailand, people are fiercely loyal to their favorite pad Thai—which is painstakingly made one plate at a time. After a taste of this quicker vegetarian version, we think you'll start to feel that same sense of loyalty.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
pad_thai.remote_photo_url =  photo_pad_thai
pad_thai.save
pesto_pasta = Meal.new(name: "Tagliatelle al pesto", description: "Brilliant green with an intense sweet perfume, Pesto alla Genovese is the pride of Genoa, the bright, earthy and pungent sauce originating in the Liguria region of northern Italy. The name comes from the Genovese word 'pestare', which means to 'pound' or 'crush', however the ingredients in traditional pesto aren't in fact pounded, but ground with the circular motion of a pestle in mortar.", pre_order_price_cents: pre_order_price, day_price_cents: day_price )
pesto_pasta.remote_photo_url =  photo_pesto_pasta
pesto_pasta.save




meals = []
meals << gnocchi
meals << poke_bowl
meals << pad_thai
meals << salad
meals << beef_tartare
meals << pesto_pasta
meals << hamburger
meals << taboule

#creation of users
puts "Creating users..."
steven = User.create!(email: 'steven.vaneecke@gmail.com', password: "123456", first_name: "Steven", last_name: "Van Eecke")
kenny = User.create!(email: 'kenny.cuoq@gmail.com', password: "123456", first_name: "Kenny", last_name: "Cuoq")
frederik = User.create!(email: 'frederik.hossak@gmail.com', password: "123456", first_name: "Frederik", last_name: "Hossak")
dree = User.create!(email: 'andreasava@hotmail.com', password: "123456", first_name: "Andreas", last_name: "Van Assche")
inou = User.create!(email: 'inou.ridder@gmail.com', password: "123456", first_name: "Inou", last_name: "Ridder")
dharam = User.create!(email: 'a@a.com', password: "123456", first_name: "Dharam", last_name: "Whabi")
elijah = User.create!(email: 'b@b.com', password: "123456", first_name: "Elijah", last_name: "Chancey")
ellyn = User.create!(email: 'c@c.com', password: "123456", first_name: "Ellyn", last_name: "Bouscasse")
hilmar = User.create!(email: 'd@d.com', password: "123456", first_name: "Hilmar", last_name: "Orth")
jethro = User.create!(email: 'e@a.com', password: "123456", first_name: "Jethro", last_name: "Williams")
john = User.create!(email: 'p@a.com', password: "123456", first_name: "John", last_name: "Ferreira")
jonas = User.create!(email: 'o@a.com', password: "123456", first_name: "Jonas", last_name: "Dieterle")
jules = User.create!(email: 'an@a.com', password: "123456", first_name: "Jules", last_name: "Jamet")
merlin = User.create!(email: 'am@a.com', password: "123456", first_name: "Merlin", last_name: "Hannemann")
owain = User.create!(email: 'al@a.com', password: "123456", first_name: "Owain", last_name: "Skyrme")
paul = User.create!(email: 'ak@a.com', password: "123456", first_name: "Paul", last_name: "Guadagnin")
roger = User.create!(email: 'aj@a.com', password: "123456", first_name: "Roger", last_name: "G")
shawkat = User.create!(email: 'ag@a.com', password: "123456", first_name: "Shawkat", last_name: "Shami")
stephen = User.create!(email: 'h@a.com', password: "123456", first_name: "Stephen", last_name: "Schuez")
victor = User.create!(email: 'f@a.com', password: "123456", first_name: "Victor", last_name: "King")
william = User.create!(email: 'g@a.com', password: "123456", first_name: "William", last_name: "Oleson")


users = []
users << steven
users << kenny
users << frederik
users << dree
users << inou
users << ellyn
users << dharam
users << elijah
users << hilmar
users << jethro
users << john
users << jonas
users << jules
users << merlin
users << owain
users << paul
users << roger
users << shawkat
users << stephen
users << victor
users << william

admins = []
admins << steven
admins << kenny
admins << dree

#creation of customer profiles
Customer.destroy_all

users.each do |user|
  customer = Customer.new(user_id: user.id)
  case user.first_name
  when 'Steven'
    customer.remote_photo_url = photo_steven
  when 'Andreas'
    customer.remote_photo_url = photo_dree
  when 'Kenny'
    customer.remote_photo_url = photo_kenny
  when 'Frederik'
    customer.remote_photo_url = photo_frederik
  when 'Inou'
    customer.remote_photo_url = photo_inou
  when 'Dharam'
   customer.remote_photo_url = photo_dharam
  when 'Elijah'
   customer.remote_photo_url = photo_elijah
  when 'Hilmar'
   customer.remote_photo_url = photo_hilmar
  when 'Jethro'
   customer.remote_photo_url = photo_jethro
  when 'John'
   customer.remote_photo_url = photo_john
  when 'Jonas'
   customer.remote_photo_url = photo_jonas
  when 'Jules'
   customer.remote_photo_url = photo_jules
  when 'Merlin'
   customer.remote_photo_url = photo_merlin
  when 'Owain'
   customer.remote_photo_url = photo_owain
  when 'Paul'
   customer.remote_photo_url = photo_paul
  when 'Roger'
   customer.remote_photo_url = photo_roger
  when 'Shawkat'
   customer.remote_photo_url = photo_shawkat
  when 'Stephen'
   customer.remote_photo_url = photo_stephen
  when 'Victor'
   customer.remote_photo_url = photo_victor
  when 'William'
   customer.remote_photo_url = photo_william
  else
   customer.remote_photo_url = photo_ellyn
  end
  customer.save
end

#creation of meal_dates
dates = []
10.times do |i|
  date = Date.today + i
  if (date.strftime('%A') != 'Saturday') && (date.strftime('%A') != 'Sunday')
    dates << date
  else
    puts 'byebye'
  end
end

puts dates

counter = 0
# today = Date.today
meal_dates = []
meals.each do |meal|
  new_meal_date = MealDate.create!(date: dates[0 + counter], meal_id: meal.id )
  counter += 1
  meal_dates << new_meal_date
  puts 'New meal date created!'
  break if meal_dates.length == 5
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
    Order.create!(meal_date_id: meal_date.id, user_id: user.id, order_price_cents: order_price, pre_order: pre, qr_code: qr, status: 'Paid')
  end
end




old_meal = MealDate.create!(date: (Date.today - 6), meal_id: pesto_pasta.id)
old_order = Order.create!(meal_date_id: old_meal.id, user_id: kenny.id, status: 'Picked up', quantity: 1, qr_code: (0...26).map { ('a'..'z').to_a[rand(26)] }.join, pre_order: false, order_price_cents: 500)
puts old_meal
puts old_order

#creation of employee profiles
Employee.destroy_all

admins.each do |admin|
  Employee.create!(user_id: admin.id, admin: true, inventory: 3)
end


#creation of reviews
Review.destroy_all

# meal_dates.each do |meal_date|
#   users.each do |user|
#   Review.create!(meal_date_id: meal_date.id, user_id: user.id, rating: rand(3..5))
#   end
# end













