# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

def create_title
  headline1 =
    ["Cozy Camper", "Hit the Road in Style", "Get Off the Beaten Path", "Unplug and Unwind", "Nomad's Nest",
     "The Ultimate Road Trip", "Experience the Great Outdoors in Our Modern Mobile Home", "Van Life Vibes", "Escape the Ordinary", "A Room with a View",
     "Your Adventure Awaits", "Rolling Home", "Take the Scenic Route", "Explore in Comfort", "Road Trip Ready",
     "Go Anywhere, Sleep Anywhere", "Van Life Dreams", "On the Move", "The Ultimate Camping Experience", "Van-tastic Adventures"
  ]
  city = Faker::Address.city
  types_of_vans =
    ["Class A Motorhome", "Class B Camper Van", "Class C Motorhome", "Converted Bus", "Pop-up Camper", "Truck Camper",
     "Teardrop Trailer", "Fifth Wheel Trailer", "Travel Trailer", "Toy Hauler"]
  "#{headline1.sample}: #{types_of_vans.sample} - #{city}"
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
  return "#{headline2.sample}"
end

def set_price_per_day
  (20..300).to_a.sample
end

def init_seed
  50.times do
    attributes = {
      title: create_title,
      description: create_description,
      price_per_day: set_price_per_day
    }
    new_listing = Listing.new(attributes)
    new_listing.save
  end
end

init_seed
