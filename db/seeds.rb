chowtable_list = {
    "1" => {
      :type => "private"
    },
    "2" => {
      :type => "booth"
    },
    "3" => {
      :type => "communal"
    },
    "4" => {
      :type => "outdoors"
    }
  }

chowtable_list.each do |name, chowtable_hash|
  p = Chowtable.new
  p.number = number
  chowtable_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

restaurant_list = {
    "Comal" => {
      :phone => 5109266300,
      :address_hash => { street_address: "2020 Shattuck Ave", city: "Berkeley", state: "CA", zipcode: "94704" }
    },
    "Pompette" => {
      :phone => 5103564737,
      :address_hash => { street_address: "1782 Fourth St", city: "West Berkeley", state: "CA", zipcode: "94710" }
    },
    "Starbucks" => {
      :phone => 5108436806,
      :address_hash => { street_address: "2224 Shattuck Ave", city: "Berkeley", state: "CA", zipcode: "94704" }
    },
    "Artis" => {
      :phone => 510898-1104,
      :address_hash => { street_address: "1717 Fourth St B", city: "Berkeley", state: "CA", zipcode: "94710" }
    }
  }

restaurant_list.each do |name, restaurant_hash|
  p = Restaurant.new
  p.name = name
  restaurant_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

reviews_list = {
    "table1_review" => {
      content: "great view",
      wobble: 5
    },
    "table2_review" => {
      content: "sticky surface",
      wobble: 3
    },
    "table3_review" => {
      content: "plasticky",
      wobble: 2
    },
    "table4_review" => {
      content: "gave me splinters",
      wobble: 1
    }
  }

reviews_list.each do |name, review_hash|
  p = Review.new
  review_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end
