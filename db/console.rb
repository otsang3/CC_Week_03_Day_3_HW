require('pry')
require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({'name' => 'J.Cole'})

album1 = Album.new({'name' => '2014 Forrest Hills Drive',
                    'genre' => 'Hip Hop',
                    'artist_id' => artist1.id})

Artist.delete_all()
Album.delete_all()

artist1.save()
album1.save()

binding.pry
nil
