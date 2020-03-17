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
s1 = Sample.create :title => 'My first loop', :audio_file => 'https://ia903101.us.archive.org/2/items/funbassloop/Fun%20Bass%20Loop.mp3', :sample_type => 'loop'
s2 = Sample.create :title => 'The greatest riff of all time', :audio_file => 'https://ia802307.us.archive.org/8/items/loop2005-08-19.flac16/loop2005-08-19d1t01.mp3', :sample_type => 'riff'
s3 = Sample.create :title => 'Cheeky bass', :audio_file => 'https://ia800301.us.archive.org/21/items/LoopTheory-RollOut/LoopTheory_Roll_Out.mp3', :sample_type => 'loop'
s4 = Sample.create :title => 'Flume Module', :audio_file => 'https://ia903102.us.archive.org/10/items/acidplanet-audio-00183931/00183931.mp3'
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
