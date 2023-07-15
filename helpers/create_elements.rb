module CreateElements
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
    Label.new(title, color)
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
    Author.new(first_name, last_name)
  end

  def create_genre
    genre = ''
    loop do
      puts 'Enter the genre name:'
      genre = gets.chomp
      break unless genre == ''

      puts 'genre name is required'
    end
    Genre.new(genre)
  end
end

def get_date_input(text)
  date_input = ''
  loop do
    print text
    date_input = gets.chomp
    break if date_input =~ /^\d{4}-\d{2}-\d{2}$/

    puts 'Date format incorrect'
  end
  date_input
end
