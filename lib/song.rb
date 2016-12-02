class Song

  attr_reader :name, :artist

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
  end

  def self.new_by_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    temp = Song.new(song_name)
    temp.artist = Artist.find_or_create_by_name(artist_name)
    temp.artist.add_song(temp)
    # binding.pry
    temp
  end
end
    # new_instance = Song.new_by_filename(file_name)
    # expect(new_instance.name).to eq('Black or White')
    # expect(new_instance.artist.name).to eq('Michael Jackson')
