require ('pry-byebug')
require_relative('models/artist.rb')
require_relative('models/albums.rb')

# Artist.delete_all()
# Album.delete_all()


artist1 = Artist.new({
  'artist_name' => 'Annie Lennox'
  })

artist1.save()

album1 = Album.new({
  'album_name' => 'Medusa',
  "genre" => "Pop/Rock",
  "link_id" => "#{artist1.id}"
  })

  album1.save()

album2 = Album.new({
  'album_name' => 'Bare',
  'genre' => "Pop"
  'link_id' => "#{artist1.id}"
  })

album2.save()



binding.pry
