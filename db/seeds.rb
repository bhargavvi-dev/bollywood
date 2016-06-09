# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



artist = Artist.find_by_real_name("Amitabh Bacchan")
unless artist
artist = Artist.create(real_name: 'Amitabh Bacchan', nick_name: 'Big B',address: 'Jalsa, Mumbai', dob:'1952-06-15',hometown: 'UP', religion:'Hindu', nationality:'Indian')
end


