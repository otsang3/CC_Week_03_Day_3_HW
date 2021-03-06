require_relative('../db/sql_runner')
require_relative('./artist')

class Album
  attr_accessor :name, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql =
    "INSERT INTO albums
    (
      name,
      genre,
      artist_id
    ) VALUES
    (
      $1, $2, $3
      ) RETURNING id"
    values = [@name, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql, [])
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "
    UPDATE albums SET
    (
      name
      genre
      artist_id
    ) =
    (
      $1, $2, $3
    ) WHERE id = $4"
    values = [@name, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results.first
    albums = Album.new(album_hash)
    return albums
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql, [])
    return albums.map { |album| Artist.new(album) }
  end


  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artist = SqlRunner.run( sql,values )
    result = Artist.new( artist.first )
    return result
  end

end
