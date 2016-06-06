# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# create user
user = User.find_by_email("ptlbhargav93@gmail.com")
unless user
 user = User.create(email: 'ptlbhargav93@gmail.com', password: 'admin@123')
end

# create artist
artist = Artist.find_by_real_name("Shahrukh Khan")
unless artist
	artist = Artist.create(real_name: 'Shahrukh Khan', nick_name: 'SRK',address: 'Mannat, Band Stand Mumbai', dob:'1962-06-15',hometown: 'Delhi', religion:'Islamic', nationality:'Indian')
end

# create artist user
artist_user = ArtistUser.find_by_artist_id_and_user_id(artist.id, user.id)
unless artist_user
  artist_user = ArtistUser.create(:artist_id => artist.id, :user_id => user.id, :is_admin => true)
end