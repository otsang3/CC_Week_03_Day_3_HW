class Album
  attr_accessor :name, :genre, :artist_id

  def initialize(options)
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

end
