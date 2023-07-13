require_relative 'game'
require_relative 'author'

class App
  def initialize
    @games = []
    @authors = []
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

  def executors(choice)
    case choice
    when 1
      list_all_games
    when 7
      list_all_authors
    when 10
      create_author
    when 13
      create_game
    end
  end
end
