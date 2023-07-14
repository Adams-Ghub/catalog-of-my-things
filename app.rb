require_relative 'game'
require_relative 'author'
require_relative 'book'
require_relative 'label'
require_relative 'save'
require_relative 'load'
require 'json'

class App
  def initialize
    @games = []
    @authors = []
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

    @books << Book.new(publisher, cover_state, published_date)
    puts "\nBook is created successfully\n\n"
  end

  def create_label
    title = ''
    color = ''

    loop do
      print 'Enter a book title:'
      title = gets.chomp
      break unless title.empty?
    end

    loop do
      print 'Enter label color:'
      color = gets.chomp
      break unless color.empty?
    end
    @labels << Label.new(title, color)
    puts "\nLabel is created successfully\n\n"
  end

  def create_author
    first_name = ''
    last_name = ''
    loop do
      puts "Enter author's first name:"
      first_name = gets.chomp
      break unless first_name == ''

      puts 'first name is required'
    end
    loop do
      puts "Enter author's last name:"
      last_name = gets.chomp
      break unless last_name == ''

      puts 'last name is required'
    end
    @authors << Author.new(first_name, last_name)
  end

  def create_game
    multiplayer_input = ''
    published_date = get_date_input('Enter published date [YYYY-MM-DD]')

    loop do
      puts 'Is game multipayer enabled? [Y]/[N]'
      multiplayer_input = gets.chomp
      break if multiplayer_input.downcase == 'y' || multiplayer_input.downcase == 'n'

      puts 'incorrect input'
    end

    last_played = get_date_input('Enter last played date [YYYY-MM-DD]')
    multiplayer_input = multiplayer_input == 'y'

    @games << Game.new(published_date, multiplayer_input, last_played)
    puts 'Game created successfully'
  end

  def get_date_input(text)
    date_input = ''
    loop do
      puts text
      date_input = gets.chomp
      break if date_input =~ /^\d{4}-\d{2}-\d{2}$/

      puts 'Date format incorrect'
    end
    date_input
  end

  def list_all_books
    if @books.empty?
      puts 'No Book available'
    else
      @books.each_with_index do |book, index|
        puts "[#{index + 1}] Publisher: #{book.publisher}, Cover_state :#{book.cover_state}\
        , Published Date:#{book.publish_date}"
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
    case choice
    when 1
      list_all_games
    when 2
      list_all_books
    when 6
      list_all_labels
    when 9
      create_book
    when 14
      create_label
    end
  end
end
