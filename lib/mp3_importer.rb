class MP3Importer

  attr_reader :path, :array, :artist

  def initialize(path)
    @path = path
  end

  def files
    @array = Dir["#{@path}/*"]
    @array.collect! do |song|
      song.split("/")[-1]
    end
  end

  def import
    ret = []
    array = self.files
    array.each do |song|
      # binding.pry
      Song.new_by_filename(song)
      # Artist.find_or_create_by_name(song.split(" - ")[0])

      # artist_instance.add_song

      # song_instance = Song.new_by_filename(song)


      # artist_instance.add_song(song.split(" - ")[1])

    end
    ret.uniq

    # binding.pry
    # array = self.files
    # array.each do |song|
    #   unless Artist.all.include?(song.split(" - ")[0])
    #     Artist.new(song.split(" - ")[0])
    #   end
    # end
  end

end


# it 'imports the files into the library by creating songs from a filename' do
#   Artist.class_variable_set("@@all",[])
#   test_music_path = "./spec/fixtures/mp3s"
#   music_importer = MP3Importer.new(test_music_path)
#   music_importer.import
#
#   expect(Artist.all.size).to eq(3)
#   expect(Artist.all.first.songs.empty? && Artist.all.last.songs.empty?).to eq(false)
# end
