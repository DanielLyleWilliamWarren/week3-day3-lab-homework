require('pg')

class Album

attr_reader(:artist_id, :id)
attr_accessor(:title, :genre)

def initialize(options)
  @title = options['title']
  @genre = options['genre']
  @artist_id = options['artist_id'].to_i
  @id = options['id'].to_i if options['id']
end


def save()
  sql = 'INSERT INTO albums
  (title, genre, artist_id)
  VALUES
  ($1, $2, $3)
  RETURNING id'
  values = [@title, @genre, @artist_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map {|album| Album.new(album)}
end

def artist()
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [@artist_id]
  artist = SqlRunner.run(sql, values)
  return Artist.new(artist[0])
end

def self.delete_all
  sql = 'DELETE FROM albums'
  SqlRunner.run(sql)
end

def update_album()
  sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
  values = [@title, @genre, @artist_id, @id]
  SqlRunner.run(sql, values)
end

def self.select_album(id)
  sql = "SELECT * FROM albums WHERE id = $1"
  values = [id]
  album = SqlRunner.run(sql, values)
  return Album.new(album[0])
end
end
