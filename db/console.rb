require('pry')
require_relative('../models/albums.rb')
require_relative('../models/artist.rb')

artist1 = Artist.new({
  'name' => 'Bon Jovi'
  })
  artist1.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Its My Life',
  'genre' => 'rock'
  })
  album1.save


binding.pry
nil
