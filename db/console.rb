require('pry')
require_relative('../models/albums.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Bon Jovi'
  })
  artist1.save()

artist2 = Artist.new({
  'name' => 'Red Hot Chillie Peppers'
  })
  artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Its My Life',
  'genre' => 'rock'
  })
  album1.save()

  album2 = Album.new({
    'artist_id' => artist1.id,
    'title' => 'Crush',
    'genre' => 'rock'
    })
    album2.save()
    album3 = Album.new({
      'artist_id' => artist2.id,
      'title' => 'Californication',
      'genre' => 'rock'
      })
      album3.save()

      album4 = Album.new({
        'artist_id' => artist2.id,
        'title' => 'Mothers milk',
        'genre' => 'rock'
        })
        album4.save()


binding.pry
nil
