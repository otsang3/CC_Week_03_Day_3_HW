require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'J.Cole'})

artist1.save()

album1 = Album.new({'name' => '2014 Forrest Hills Drive',
                    'genre' => 'Hip Hop',
                    'artist_id' => artist1.id})

album1.save()

album1.delete()
artist1.name = "Drake"
artist1.save()


binding.pry
nil
