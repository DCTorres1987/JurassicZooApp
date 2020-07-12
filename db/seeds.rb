# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Zoo.create(name: 'Jurassic Zoo', location: '1800 Jurassic Lane, Isla Nublar', image: 'https://cdn1.beachdeals.com/wp/wp-content/uploads/2018/02/near-koloa-hawaii-660x250-GettyImages-534481599.jpg'); 
Zoo.create(name: 'Jurassic Land', location: '745 Jurassic Road, South Isla Nublar', image: 'https://getawaygreg.files.wordpress.com/2013/01/hawaii-small.jpg');

# Attractions
Attraction.create!(name: 'Jurrasic Zoo Carnivore Exhibit',zoo_id: 1);
Attraction.create!(name: 'Jurrasic Zoo Herbivore Exhibit and Bird Exhibt',zoo_id: 1);
Attraction.create!(name: 'Jurrasic Land Herbivore and Sea Monster Exhibit',zoo_id: 2);

Dinosaur.create!(name: 'Allosaurus',image:'https://vignette.wikia.nocookie.net/jurassicworld-evolution/images/a/ac/JWEAllosaurus01.png/revision/latest/scale-to-width-down/310?cb=20190925195831');
Dinosaur.create!(name: 'Ankylosaurus', image: 'https://vignette.wikia.nocookie.net/jurassicworld-evolution/images/6/65/JWEAnkylosaurus.png/revision/latest/scale-to-width-down/310?cb=20190426221948');
Dinosaur.create!(name: 'Tyrannosaurus rex', image: 'https://vignette.wikia.nocookie.net/jurassicpark/images/f/f8/T-Rex.png/revision/latest/scale-to-width-down/310?cb=20141128030334');
Dinosaur.create!(name:'Mosasaurus', image: 'https://vignette.wikia.nocookie.net/jurassicpark/images/7/72/Mosasaurus-detail-header.png/revision/latest/scale-to-width-down/310?cb=20141230042852');
Dinosaur.create!(name: 'Stegosaurus', image: 'https://vignette.wikia.nocookie.net/jurassicpark/images/4/4c/Stegosaurus-detail-header.png/revision/latest/scale-to-width-down/310?cb=20141230042616');
Dinosaur.create!(name: 'Triceratops', image: 'https://vignette.wikia.nocookie.net/jurassicpark/images/a/ab/Triceratops_Jurassic_World.png/revision/latest/scale-to-width-down/310?cb=20180427210959');
Dinosaur.create!(name: 'Velociraptor', image: 'https://vignette.wikia.nocookie.net/jurassicpark/images/1/12/Velociraptor-detail-header.png/revision/latest/scale-to-width-down/310?cb=20150420213742');
Dinosaur.create!(name: 'Pteranodon', image: 'https://vignette.wikia.nocookie.net/jurassicpark/images/1/1a/Terry.png/revision/latest/scale-to-width-down/310?cb=20150227003720');

