# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Zoo.create(name: 'Jurassic Zoo', location: '1800 Jurassic Lane, Isla Nublar'); 
# Zoo.create(name: 'Jurassic Land', location: '745 Jurassic Road, South Isla Nublar');
# Worker.create!(name: 'Dani Gems', email: 'dani@gmail.com', username: 'danigem', password_digest: 'universe1', zoo_id: 1); 
WorkerAddress.create(address_type: 'Home', address1: '123 Silver Lane', city: 'Monroe', state: 'NC', zip: '28110', worker_id: 1);