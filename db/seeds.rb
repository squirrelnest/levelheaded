# Create restaurants

comal = Restaurant.create({name: "Comal", phone: 5109266300, :address_hash => { street_address: "2020 Shattuck Ave", city: "Berkeley", state: "CA", zipcode: "94704" } })
pompette = Restaurant.create({name: "Pompette", phone: 5103564737, :address_hash => { street_address: "1782 Fourth St", city: "West Berkeley", state: "CA", zipcode: "94710" } })
starbucks = Restaurant.create({name: "Starbucks", phone: 5108436806, :address_hash => { street_address: "2224 Shattuck Ave", city: "Berkeley", state: "CA", zipcode: "94704" } })
artis = Restaurant.create({name: "Artis", phone: 5108981104, :address_hash => { street_address: "1717 Fourth St B", city: "Berkeley", state: "CA", zipcode: "94710" } })

# Create tables

a = Chowtable.create({restaurant: comal, number: 81, table_type: "booth"})
b = Chowtable.create({restaurant: pompette, number: 82, table_type: "communal"})
c = Chowtable.create({restaurant: starbucks, number: 83, table_type: "private"})
d = Chowtable.create({restaurant: artis, number: 84, table_type: "outdoor"})
e = Chowtable.create({restaurant: comal, number: 85, table_type: "window"})

# Create users

alice = User.create({name: "Alice", password: "Alice"})
betty = User.create({name: "Betty", password: "Betty"})
chris = User.create({name: "Chris", password: "Chris"})

# Create reviews

Review.create([
  {content: "sticky surface", wobble: 0, restaurant: comal, user: alice, chowtable: a},
  {content: "smells like teen spirit", wobble: 1, restaurant: pompette, user: betty, chowtable: b},
  {content: "great view", wobble: 2, restaurant: starbucks, user: chris, chowtable: c},
  {content: "ruddy hair all over", wobble: 3, restaurant: artis, user: alice, chowtable: d},
  {content: "earthquaaaaaake!", wobble: 4, restaurant: artis, user: betty, chowtable: e},
  {content: "missing a leg", wobble: 5, restaurant: comal, user: chris, chowtable: a},
  {content: "rock solid", wobble: 5, restaurant: pompette, user: alice, chowtable: b}
])


# chowtable_list = {
#     "1" => {
#       :type => "private"
#     },
#     "2" => {
#       :type => "booth"
#     },
#     "3" => {
#       :type => "communal"
#     },
#     "4" => {
#       :type => "outdoors"
#     }
#   }
#
# chowtable_list.each do |name, chowtable_hash|
#   p = Chowtable.new
#   p.number = number
#   chowtable_hash.each do |attribute, value|
#       p[attribute] = value
#   end
#   p.save
# end
#
# restaurant_list = {
#     "Comal" => {
#       :phone => 5109266300,
#       :address_hash => { street_address: "2020 Shattuck Ave", city: "Berkeley", state: "CA", zipcode: "94704" }
#     },
#     "Pompette" => {
#       :phone => 5103564737,
#       :address_hash => { street_address: "1782 Fourth St", city: "West Berkeley", state: "CA", zipcode: "94710" }
#     },
#     "Starbucks" => {
#       :phone => 5108436806,
#       :address_hash => { street_address: "2224 Shattuck Ave", city: "Berkeley", state: "CA", zipcode: "94704" }
#     },
#     "Artis" => {
#       :phone => 5108981104,
#       :address_hash => { street_address: "1717 Fourth St B", city: "Berkeley", state: "CA", zipcode: "94710" }
#     }
#   }
#
# restaurant_list.each do |name, restaurant_hash|
#   p = Restaurant.new
#   p.name = name
#   restaurant_hash.each do |attribute, value|
#       p[attribute] = value
#   end
#   p.save
# end
#
# reviews_list = {
#     "table1_review" => {
#       content: "great view",
#       wobble: 5
#     },
#     "table2_review" => {
#       content: "sticky surface",
#       wobble: 3
#     },
#     "table3_review" => {
#       content: "plasticky",
#       wobble: 2
#     },
#     "table4_review" => {
#       content: "gave me splinters",
#       wobble: 1
#     }
#   }
#
# reviews_list.each do |name, review_hash|
#   p = Review.new
#   review_hash.each do |attribute, value|
#       p[attribute] = value
#   end
#   p.save
# end
