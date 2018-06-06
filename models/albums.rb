require('pg')

class Album

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

end
