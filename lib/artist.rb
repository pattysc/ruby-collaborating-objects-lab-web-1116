class Artist

  attr_reader :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs ||= []
    @@all << self
    # unless @@all.include?(name)
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    found_artist = @@all.find {|artist| artist.name == name}

    if found_artist
      found_artist
    else
      Artist.new(name)
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end
