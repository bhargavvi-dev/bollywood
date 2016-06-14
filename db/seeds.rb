# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# create user
user = User.find_by_email("shahrukhkhan@gmail.com")
unless user
 user = User.create(email: 'shahrukhkhan@gmail.com', password: 'admin@123')
 puts 'user created'
end

user1 = User.find_by_email("amitabh@gmail.com")
unless user1
 user1 = User.create(email: 'amitabh@gmail.com', password: 'admin@123')
 puts 'user1 created'
end

user2 = User.find_by_email("bhargav@gmail.com")
unless user2
 user2 = User.create(email: 'bhargav@gmail.com', password: 'admin@123')
 puts 'user2 created'
end

# create artist
artist = Artist.find_by_real_name("Shahrukh Khan")
unless artist
	artist = Artist.create(real_name: 'Shahrukh Khan', nick_name: 'SRK',address: 'Mannat, Band Stand Mumbai', dob:'1962-06-15',hometown: 'Delhi', religion:'Islamic', nationality:'Indian')
	puts 'artist created'
end

artist1 = Artist.find_by_real_name("amitabh")
unless artist1
	artist1 = Artist.create(real_name: 'amitabh', nick_name: 'big b',address: 'Jalsa Mumbai', dob:'1955-07-15',hometown: 'Delhi', religion:'Hindu', nationality:'Indian')
	puts 'artist1 created'
end

# create artist user
artist_user = ArtistUser.find_by_artist_id_and_user_id(artist.id, user.id)
unless artist_user
  artist_user = ArtistUser.create(:artist_id => artist.id, :user_id => user.id, :is_admin => true)
  puts 'artist_user created'
end

artist_user2 = ArtistUser.find_by_artist_id_and_user_id(artist1.id, user1.id)
unless artist_user2
  artist_user2 = ArtistUser.create(:artist_id => artist1.id, :user_id => user1.id, :is_admin => true)
  puts 'artist_user2 created'
end

artist_user1 = ArtistUser.find_by_artist_id_and_user_id(artist1.id, user2.id)
unless artist_user1
  artist_user1 = ArtistUser.create(:artist_id => artist1.id, :user_id => user2.id, :is_admin => false)
  puts 'artist_user1 created'
end

