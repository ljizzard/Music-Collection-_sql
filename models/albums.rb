
require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_accessor :album_name, :link_id
  attr_reader :id

  def intialize(options)
    @id = options['id'].to_i() if options['id']
    @album_name = options['album_name']
    @genre = options['genre']
    @link_id = options['link_id'].to_i
  end


  def save()
    sql = "INSERT INTO albums (id, album_name, genre, link_id)
          VALUES ($1, $2)returning id"
    values = [@id, @album_name, @genre, @link_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map {|album| Album.new(album)}
  end

  def self.find_by_artist(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@link_id]
    result = SqlRunner.run(sql, values)[0]
    return Album.new(result)
  end


end
