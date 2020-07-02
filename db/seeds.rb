# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Zoo.create(name: 'Jurassic Zoo', location: '1800 Jurassic Lane, Isla Nublar', image: 'https://cdn1.beachdeals.com/wp/wp-content/uploads/2018/02/near-koloa-hawaii-660x250-GettyImages-534481599.jpg'); 
# Zoo.create(name: 'Jurassic Land', location: '745 Jurassic Road, South Isla Nublar', image: 'https://getawaygreg.files.wordpress.com/2013/01/hawaii-small.jpg');
User.create!(name: 'Dani Gems', email: 'dani@gmail.com', username: 'danigem', password_digest: 'universe1', zoo_id: 1); 
# WorkerAddress.create(address_type: 'Home', address1: '123 Silver Lane', city: 'Monroe', state: 'NC', zip: '28110', worker_id: 1);