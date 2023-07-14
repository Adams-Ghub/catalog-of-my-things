require_relative 'game'
require_relative 'author'
require_relative 'music_album'
require_relative 'genre'
require_relative 'book'
require_relative 'label'
require_relative 'save'
require_relative 'load'
require_relative 'create_elements'
require 'json'

class App
  include CreateElements
  def initialize
    @games = []
    @authors = []
    @music_albums = []
    @genres = []
    @books = []
    @labels = []
  end

  def load
    load_books
    load_labels
  end

  def save(_data)
    save_books
    save_label
    puts 'You Quited'
  end

  def create_book
    publisher = ''
    cover_state = ''
    label = create_label
    loop do
      print 'Enter a book publisher:'
      publisher = gets.chomp
      break unless publisher.empty?
    end
    loop do
      print 'Enter Cover state:'
      cover_state = gets.chomp
      break unless cover_state.empty?
    end
    published_date = get_date_input('Enter published date [YYYY-MM-DD]')
    my_book = Book.new(publisher, cover_state, published_date)
    @books << my_book
    @labels << label.add_item(my_book)
    puts "\nBook is created successfully\n\n"
  end

  def list_all_genres
    if @genres.empty?
      puts 'No Genres available'
    else
      @genres.each_with_index do |genre, index|
        puts "#{index + 1})  #{genre.name}"
      end
    end
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No Music Albums available.'
    else
      @music_albums.each_with_index do |music_album, index|
        on_spotify = music_album.on_spotify ? 'Yes' : 'No'
        puts "#{index + 1}) Published date: #{music_album.publish_date}   \
           Is it on Spotify: #{on_spotify}     genre: #{music_album.genre.name}"
      end
    end
  end

  def create_game
    multiplayer_input = ''
    author = create_author
    published_date = get_date_input('Enter published date [YYYY-MM-DD]')
    loop do
      puts 'Is game multipayer enabled? [Y]/[N]'
      multiplayer_input = gets.chomp
      break if multiplayer_input.downcase == 'y' || multiplayer_input.downcase == 'n'

      puts 'incorrect input'
    end
    last_played = get_date_input('Enter last played date [YYYY-MM-DD]')
    multiplayer_input = multiplayer_input == 'y'
    game = Game.new(published_date, multiplayer_input, last_played)
    @authors << author.add_item(game)
    @games << game
    puts "Game created successfully \n \n"
  end

  def create_music_album
    spotify = ''
    genre = create_genre
    publish_date = get_date_input('Enter the music album\'s release date [YYYY-MM-DD]: ')
    loop do
      print 'Is it on spotify? [Y]/[N]: '
      spotify = gets.chomp
      break if spotify.downcase == 'y' || spotify.downcase == 'n'

      puts 'incorrect input'
    end
    if spotify == 'y'
      on_spotify = true
    else
      spotify = false
    end
    music_album = MusicAlbum.new(publish_date, on_spotify)
    @genres << genre.add_item(music_album)
    @music_albums << music_album
    puts 'Music Album created successfully'
  end

  def list_all_books
    if @books.empty?
      puts 'No Book available'
    else
      @books.each_with_index do |book, index|
        puts "[#{index + 1}] Publisher: #{book.publisher},\
         Cover_state :#{book.cover_state}, Published Date:#{book.publish_date}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts 'No Label available'
    else
      @labels.each_with_index do |label, index|
        puts "[#{index + 1}] Label Title: #{label.title}, Label Color :#{label.color}"
      end
    end
  end

  def list_all_games
    if @games.empty?
      puts 'No games available.'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1}) Published date: #{game.publish_date} multiplayer:#{game.multiplayer}\
        last played:#{game.last_played_at}"
      end
    end
  end

  def list_all_authors
    if @authors.empty?
      puts 'No authors available'
    else
      @authors.each_with_index do |author, index|
        puts "#{index + 1})  #{author.first_name} #{author.last_name}"
      end
    end
  end

  def executors(choice)
    actions = {
      1 => method(:list_all_games), 2 => method(:list_all_books), 3 => method(:list_all_music_albums),
      4 => method(:list_all_genres), 5 => method(:list_all_labels), 6 => method(:list_all_authors),
      7 => method(:create_book), 8 => method(:create_music_album), 9 => method(:create_game)
    }
    action = actions[choice]
    if action
      action.call
    else
      puts 'Invalid choice.'
    end
  end
end
