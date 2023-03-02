# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

photo_urls = [
  "https://images.unsplash.com/photo-1561361513-2d000a50f0dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1752&q=80.jpg",
  "https://images.unsplash.com/photo-1576793048000-494aaa93d160?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1594495894542-a46cc73e081a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80.jpg",
  "https://images.unsplash.com/photo-1535655685871-dc8158ff167e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80.jpg",
  "https://images.unsplash.com/photo-1583797227225-4233106c5a2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80.jpg",
  "https://images.unsplash.com/photo-1549194898-60fd030ecc0f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1602721186896-1b21c7405c0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg",
  "https://images.unsplash.com/photo-1626827521786-1909df055fa8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1597685204565-110abf469a1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1624355761500-f00bb5cfb5a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1591706515036-cb0f48dc5e62?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1569520884908-682f382556e1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1520532240459-395dc4a823b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1613750590555-5ad35bd95a99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80.jpg",
  "https://images.unsplash.com/photo-1619677394722-6397960e590b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80.jpg",
  "https://images.unsplash.com/photo-1604917231069-37c843cf6ffb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1623428699743-04b189dd7794?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1569346306867-b2c7a6b22099?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg",
  "https://images.unsplash.com/photo-1572830093421-377d162ca866?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1627386172764-1d1b7ea90b66?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80.jpg",
  "https://images.unsplash.com/photo-1587061117885-ac5b26d96e4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80.jpg",
  "https://images.unsplash.com/photo-1619389136796-ebf6a39d507c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1364&q=80.jpg",
  "https://images.unsplash.com/photo-1578355830625-2f9fb17c0717?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80.jpg",
  "https://images.unsplash.com/photo-1607588330193-d0fb508bba95?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1605410791216-3d9653a95667?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1606759163253-094133091882?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1607867086119-b6fe028fa3a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80.jpg",
  "https://images.unsplash.com/photo-1628499139581-739194851413?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1589485257513-697766b2358b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1450&q=80.jpg",
  "https://images.unsplash.com/photo-1464851707681-f9d5fdaccea8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1833&q=80.jpg",
  "https://images.unsplash.com/photo-1534756287545-6b3a471d4e0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1574731817621-bb2ead96e6ee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1704&q=80.jpg",
  "https://images.unsplash.com/photo-1532015804402-87817ed02d2a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1794&q=80.jpg",
  "https://images.unsplash.com/photo-1569850402770-2fd98fff8ee3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1597192535374-aeba30156218?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1523987355523-c7b5b0dd90a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1592351763700-b9b35a6465ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1566847838496-c670dd0ec05e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1563783850023-077d97825802?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1596470692137-ead1053a1e5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1515876305430-f06edab8282a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80.jpg",
  "https://images.unsplash.com/photo-1568555013133-1a59503c7667?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1626680114529-3f6ffa002b80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=770&q=80.jpg",
  "https://images.unsplash.com/photo-1574260031597-bcd9eb192b4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80.jpg",
  "https://images.unsplash.com/photo-1595251823086-930f6265cccc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1709&q=80.jpg",
  "https://images.unsplash.com/photo-1513311068348-19c8fbdc0bb6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg",
  "https://images.unsplash.com/photo-1560871958-59f4647aa6ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80.jpg",
  "https://images.unsplash.com/photo-1588621941918-0517116318c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg",
  "https://images.unsplash.com/photo-1516939884455-1445c8652f83?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80.jpg",
  "https://images.unsplash.com/photo-1596470689751-54f9687c1b7f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80.jpg"
]

def create_fake_user
  email = Faker::Internet.email(name: Faker::Name.name)
  password = Faker::Internet.password(min_length: 8)
  User.create({ email: email, password: password })
end

def types_of_vans
  ["Class A Motorhome", "Class B Camper Van", "Class C Motorhome", "Converted Bus", "Pop-up Camper", "Truck Camper",
   "Teardrop Trailer", "Fifth Wheel Trailer", "Travel Trailer", "Toy Hauler"].sample
end

def create_title(types_of_vans)
  headline1 =
    ["Cozy Camper", "Hit the Road in Style", "Get Off the Beaten Path", "Unplug and Unwind", "Nomad's Nest",
     "The Ultimate Road Trip", "Experience the Great Outdoors in Our Modern Mobile Home", "Van Life Vibes", "Escape the Ordinary", "A Room with a View",
     "Your Adventure Awaits", "Rolling Home", "Take the Scenic Route", "Explore in Comfort", "Road Trip Ready",
     "Go Anywhere, Sleep Anywhere", "Van Life Dreams", "On the Move", "The Ultimate Camping Experience", "Van-tastic Adventures"
  ]
  headline1.sample
end

def create_city
  Faker::Address.city
end

def true_false
  [true, false].sample
end

def size_capacity
  (2..6).to_a.sample
end

def create_description
  headline2 = [
    "Wanderlust on Wheels: Rent Our Vintage Camper Van Today",
    "Van Life Made Easy: Book Our Fully Equipped Campervan on Van Away",
    "Get Lost in Style: Our Modern Camper Van Rental for Your Next Adventure",
    "Roam Free: Our Off-Road Camper Van Rental for Your Next Escape",
    "The Open Road Awaits: Rent Our Adventure-Ready Campervan Today",
    "Escape to the Great Outdoors: Book Our Spacious Campervan on Van Away",
    "The Ultimate Road Trip Companion: Rent Our Custom Camper Van Now",
    "Journey to Your Next Destination in Style: Book Our Luxury Campervan on Van Away",
    "Experience the Freedom of the Road: Rent Our Classic Camper Van Today",
    "Cruise in Comfort: Our Family-Friendly Campervan Rental for Your Next Vacation",
    "Our campervan is perfect for couples or solo travelers seeking an adventurous escape.",
    "With its compact size and easy maneuverability, our camper van is great for first-time van lifers.",
    "Our campervan is fully equipped with everything you need for a comfortable road trip, including a kitchenette, comfy bed, and storage space for all your gear.",
    "With its classic design and modern amenities, our campervan is the perfect blend of old-school charm and contemporary comfort.",
    "Our campervan rental is ideal for anyone who wants to explore the great outdoors without sacrificing the comforts of home.",
    "Whether you're embarking on a cross-country road trip or just a weekend getaway, our campervan will take you there in style.",
    "Our camper van rental comes with all the gear you need for a fun and hassle-free camping experience, from cooking supplies to camp chairs.",
    "With its ample storage space and efficient design, our campervan can accommodate up to two adults and two small children.",
    "Our campervan is the ultimate mobile home-away-from-home, with everything you need to live, work, and play on the road.",
    "Whether you're cruising down the coast or heading off the beaten path, our campervan is the perfect companion for your journey.",
    "Our campervan rental is ideal for outdoor enthusiasts who want to camp in comfort, with a cozy bed and a kitchenette for cooking up tasty meals.",
    "With its sleek design and rugged performance, our campervan is ready for any adventure you can throw at it.",
    "Our campervan rental is pet-friendly, so you can bring your furry friend along for the ride.",
    "With its fuel-efficient engine and compact size, our campervan is perfect for eco-conscious travelers who want to minimize their carbon footprint.",
    "Our campervan is equipped with all the latest technology, including a touchscreen entertainment system and a backup camera for added safety.",
    "Our campervan rental is a great way to explore the beauty of the outdoors without sacrificing comfort or convenience.",
    "With its spacious interior and modern amenities, our campervan is perfect for extended road trips or full-time van life.",
    "Our campervan rental is an affordable way to see the country and experience the freedom of the open road.",
    "With its comfortable bed, ample storage, and full kitchen, our campervan is the perfect home base for your next outdoor adventure.",
    "Our campervan rental is fully insured and comes with roadside assistance, so you can travel with peace of mind."
  ]
  headline2.sample
end

def set_price_per_day
  (20..300).to_a.sample
end

def set_cents_per_day
  (1..100).to_a.sample / 100.to_f
end

mcdonalds_address_array = [
  "67 Military Road, Avondale Heights, VIC",
  "190-200 Ballarat Road, Footscray, VIC",
  "5 St Albans Road, St Albans, VIC",
  "1500 Eastlink Northbound, Scoresby, VIC",
  "1464 Ferntree Gully Road, Knoxfield, VIC",
  "Cnr Fulham & Stud Roads, Rowville, VIC",
  "740-742 Burwood Highway, Ferntree Gully, VIC",
  "314 Mountain Highway, Wantirna, VIC",
  "267 Dorset Road, Boronia, VIC",
  "519 Waverley Road, Mount Waverley, VIC",
  "296 Canterbury Road, Bayswater North, VIC",
  "51-57 Maroondah Highway, Ringwood, VIC",
  "1736-1740 Dandenong Road, Clayton, VIC",
  "414 Warrigal Road, Heatherton, VIC",
  "661-663 Warrigal Road, South Oakleigh, VIC",
  "Cnr Poath & North Roads, Oakleigh, VIC",
  "Cnr Boundary & Centre Dandenong Roads, Braeside, VIC",
  "652-656 North Road, Ormond, VIC",
  "Plenty Valley Shopping Centre, 415 McDonalds Rd, Mill Park, VIC",
  "400 Plenty Road Cnr University Drive, Mill Park, VIC",
  "Epping Plaza Shopping Centre, High St (cnr Cooper St), Epping, VIC",
  "Cnr High Street & Childs Road, Epping, VIC",
  "30 Dalton Roads (cnr Settlement Rd), Thomastown, VIC",
  "110 Harvest Home Road, Wollert, VIC",
  "1405 Plenty Road, Mernda, VIC",
  "Cnr Davis Rd & Hummingbird Boulevard, Tarneit, VIC",
  "Manor Lakes Boulevarde (Cnr Ballan Rd), Wyndham Vale, VIC",
  "1-9 Jamieson Way, Point Cook, VIC",
  "223 Cranbourne Road, Karingal, VIC",
  "Cnr Westernport Highway & Hall Road, Skye, VIC",
  "1 Silver Banksia Boulevarde, Cranbourne, VIC",
  "930 Thompsons Road, Cranbourne West, VIC",
  "970 Nepean Highway, Mornington, VIC",
  "Cnr Springvale & Heatherton Roads, Springvale, VIC",
  "970 Nepean Highway, Mornington, VIC",
  "84-94 Osborne Avenue , Springvale, VIC",
  "Cnr Princess Hwy & Smith Rd, Springvale, VIC",
  "Cnr Princes Highway & Elonera Road, Noble Park, VIC",
  "Cnr Boundary & Centre Dandenong Roads, Braeside, VIC",
  "317 Cheltenham Road, Keysborough, VIC",
  "Cnr Cheltenham & Perry Roads, Keysborough, VIC",
  "100 Waverley Road, Malvern East, VIC",
  "1341 Dandenong Rd, Chadstone, VIC",
  "1333 Dandenong Rd, Malvern East, VIC",
  "Chadstone Shopping Centre, 1341 Dandenong Rd, Chadstone, VIC",
  "606 Warrigal Road, Holmesglen, VIC"
]

def create_new_listing(url, counter, address)
  file = URI.open(url)
  p attributes = {
    title: create_title(types_of_vans),
    description: create_description,
    price_per_day: set_price_per_day + set_cents_per_day,
    address: address[counter],
    capacity: size_capacity,
    pet_friendly: true_false,
    luxury: true_false,
    wifi: true_false,
    bbq: true_false,
    kitchen: true_false,
    bathroom: true_false,
    shower: true_false,
    tv: true_false,
    airconditioning: true_false,
    heating: true_false,
    user: create_fake_user
  }
  new_listing = Listing.new(attributes)
  new_listing.photo.attach(io: file, filename: "van_#{counter}.jpg", content_type: "image/jpg")
  new_listing.save
end

def init_listing_seed(array, address)
  counter = 1
  array.each do |url|
    create_new_listing(url, counter, address)
    counter += 1
    sleep 1
  end
end

init_listing_seed(photo_urls, mcdonalds_address_array)
