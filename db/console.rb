require('pry')
require_relative('../models/album')
require_relative('../models/artist')

# Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new({'name' => 'J.Cole'})

artist1.save()

album1 = Album.new({'name' => '2014 Forrest Hills Drive',
                    'genre' => 'Hip Hop',
                    'artist_id' => artist1.id})

album1.save()

artist1.name = "Drake"
artist1.update()


# album1.name = "Good girls gone bad"
# album1.update()


binding.pry
nil
