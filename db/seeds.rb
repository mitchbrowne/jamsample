User.destroy_all
u1 = User.create :email => 'wood@gmail.com', :password => 'fish', :name => 'woody'
u2 = User.create :email => 'dorian@gmail.com', :password => 'fish', :name => 'The Dorian Moddel'
u3 = User.create :email => 'mitch@gmail.com', :password => 'fish', :admin => 'true', :name => 'Lord of the Jives'
u4 = User.create :email => 'buzz@gmail.com', :password => 'fish', :name => 'Mr Lightyear'
puts "#{ User.count } users created"


Collection.destroy_all
c1 = Collection.create :name => 'Cool Loops', :image => 'https://pro2-bar-s3-cdn-cf1.myportfolio.com/9f2ccb967f857ff41835c1865a420465/238699c8-63a9-4d9f-8018-f425fc520865_rw_1200.jpg?h=866ad46734b7f992fdb4fe15fd1edffc'
c2 = Collection.create :name => 'Sweet Riffs'
puts "#{ Collection.count } collections created"

Genre.destroy_all
g1 = Genre.create :name => 'House'
g2 = Genre.create :name => 'Blues'
g3 = Genre.create :name => 'Jazz'
g4 = Genre.create :name => 'Electronic'
g5 = Genre.create :name => 'Classical'
g6 = Genre.create :name => 'Psychadelic'
g7 = Genre.create :name => 'Indie Rock'
puts "#{ Genre.count } genres created"


Sample.destroy_all
s1 = Sample.create :title => 'My first loop', :audio_file => 'https://ia903101.us.archive.org/2/items/funbassloop/Fun%20Bass%20Loop.mp3', :image => 'https://i.redd.it/lgp6xdtrnja31.jpg', :sample_type => 'loop'
s2 = Sample.create :title => 'The greatest riff of all time', :audio_file => 'https://ia802307.us.archive.org/8/items/loop2005-08-19.flac16/loop2005-08-19d1t01.mp3', :image => 'https://blog.spoongraphics.co.uk/wp-content/uploads/2017/album-art/42.jpg', :sample_type => 'riff'
s3 = Sample.create :title => 'Cheeky bass', :audio_file => 'https://ia800301.us.archive.org/21/items/LoopTheory-RollOut/LoopTheory_Roll_Out.mp3', :image => 'https://s3.amazonaws.com/media.ai-ap.com/dam/cropped/2016/07/04/taxaliweb_luya5oc.JPEG', :sample_type => 'loop'
s4 = Sample.create :title => 'Flume Module', :audio_file => 'https://ia903102.us.archive.org/10/items/acidplanet-audio-00183931/00183931.mp3', :image => 'https://andreiverner.com/wp-content/uploads/2012/01/step_18.jpg'
s5 = Sample.create :title => 'Rocket Man', :audio_file => 'https://ia601003.us.archive.org/6/items/acidplanet-audio-00409321/00409321.mp3', :image => 'https://i.pinimg.com/originals/0c/c9/57/0cc957d28f61df43b67b7ff8710acf8b.jpg'
s6 = Sample.create :title => 'Space Jam', :audio_file => 'https://ia800407.us.archive.org/0/items/FunkyAssBassLine/Funky%20Ass%20Bass%20Line.mp3', :image => 'https://images.squarespace-cdn.com/content/v1/5254bc89e4b0e53491ed4bbc/1503389636107-14PBBEZF84GWCZVK2QSV/ke17ZwdGBToddI8pDm48kJUlZr2Ql5GtSKWrQpjur5t7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UfNdxJhjhuaNor070w_QAc94zjGLGXCa1tSmDVMXf8RUVhMJRmnnhuU1v2M8fLFyJw/rivercity2.jpg?format=1500w'
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
u4.samples << s5 << s6
