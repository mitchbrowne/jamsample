User.destroy_all
u1 = User.create :email => 'wood@gmail.com', :password => 'fish', :name => 'woody'
u2 = User.create :email => 'dorian@gmail.com', :password => 'fish', :name => 'The Dorian Moddel'
u3 = User.create :email => 'mitch@gmail.com', :password => 'fish', :admin => 'true', :name => 'Lord of the Jives'
puts "#{ User.count } users created"


Collection.destroy_all
c1 = Collection.create :name => 'Cool Loops'
c2 = Collection.create :name => 'Sweet Riffs'
puts "#{ Collection.count } collections created"

Genre.destroy_all
g1 = Genre.create :name => 'House'
g2 = Genre.create :name => 'Blues'
g3 = Genre.create :name => 'Jazz'
g4 = Genre.create :name => 'Electronic'
puts "#{ Genre.count } genre created"


Sample.destroy_all
s1 = Sample.create :title => 'My first loop', :audio_file => 'https://archive.org/details/SalvatoreDeRosaLoopN4', :sample_type => 'loop'
s2 = Sample.create :title => 'Cool riff', :audio_file => 'https://archive.org/details/GuitarRiffIThoughtWasCool-', :sample_type => 'riff'
s3 = Sample.create :title => 'Cheeky bass', :audio_file => 'https://archive.org/details/Karls_Bass_riff', :sample_type => 'loop'
s4 = Sample.create :title => 'Flume Module', :audio_file => 'https://archive.org/details/Karls_Bass_riff'
puts "#{ Sample.count } samples created"

# Associations #######################################
puts "Genres and Samples"
s1.genres << g1 << g4
s2.genres << g2
s3.genres << g1

puts "Collections and Samples"
c1.samples << s1 << s3
c2.samples << s2

puts "Collections and Users"
u1.collections << c1
u2.collections << c2

puts "Samples and Users"
u1.samples << s1 << s3
u2.samples << s2 << s4
