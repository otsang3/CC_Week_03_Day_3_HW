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
      ) RETURNING *"
    values = [@name, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql, [])
  end

end
