class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call

    loop do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets
    if input.chomp == "list songs"
      list_songs
    elsif input.chomp == "list artists"
      list_artists
    elsif input.chomp == "list genres"
      list_genres
    elsif input.chomp == "list artist"
      list_songs_by_artist
    elsif input.chomp == "list genre"
      list_songs_by_genre
    elsif input.chomp == "play song"
      play_song
    end
      break if input.chomp == "exit"

    end
  end

  def list_songs
    Song.all.sort_by{|s| s.name}.uniq.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by{|a| a.name}.uniq.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by{|g| g.name}.uniq.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
# <<<<<<< HEAD
    # list = Artist.all.collect{|a| a.name == input.chomp}
    # binding.pry
    artist = ""

    Artist.all.each {|a|
      if a.name == input.chomp
        artist = a
      end}

      artist.songs.sort_by{|song| song.name}.each.with_index(1) do |song ,index|
        puts "#{index}. #{song.name} - #{genre.name}"
      end
      # binding.pry
    #   {|a|
    #   a.songs.each {|s| s.name}}.each.with_index(1) do |artist, index|
    #     artist.each do |songs|
    #       song.genre.name
    #
    #     # binding.pry
    #   puts "#{index}. #{artist.name}"
    # end

    # new_list = []
    # Song.all.sort_by{|s| s.name}.uniq.each do |song|
    #    if input.chomp == "#{song.artist.name}"
    #    new_list << song unless new_list.include?(song)
    #    elsif new_list.each.with_index(1) do |song, index|
    #       puts "#{index}. #{song.name} - #{song.genre.name}"
    #     end
    #   end
# =======
    # list = Song.all.sort_by{|s| s.name}.uniq
    # binding.pry
    # new_list = list.collect! do |song|
    #    "#{song.artist.name}" == input.chomp
    #    binding.pry



# >>>>>>> 548cf6f22b58d40e4405f4b6dc507281e1e1b289

    # Song.all.sort_by{|s| s.name}.uniq.collect.with_index(1) do |song, index|
    #   if input.chomp == "#{song.artist.name}"
    #     puts "#{index}. #{song.name} - #{song.genre.name}"
    #   end
# <<<<<<< HEAD

# =======
    # end
    # binding.pry
# >>>>>>> 548cf6f22b58d40e4405f4b6dc507281e1e1b289
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    new_list = []
    Song.all.sort_by{|s| s.name}.uniq.each do |song|
      if input.chomp == "#{song.genre.name}"
        new_list
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets
    Song.all.sort_by{|s| s.name}.uniq.each.with_index(1) do |song, index|
      if input.chomp == "#{index}"
      puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
