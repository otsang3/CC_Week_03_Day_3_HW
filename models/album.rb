class Album
  attr_accessor :name, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id']
    @id = options['id'].to_i if options['id']
  end

end
