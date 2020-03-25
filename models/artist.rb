require_relative('../db/sql_runner')

class Artist
  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql =
    "INSERT INTO artists (name) VALUES ($1) RETURNING *"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql, [])
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "
    UPDATE artists SET
    (
      name
    ) VALUES
    (
      $1
    ) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

end
