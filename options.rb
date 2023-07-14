require_relative 'app'

class Options
  def choices
    puts 'WELCOME TO CATALOG OF MY THINGS APP'
    puts 'Choose an option by entering its number'
    puts '1. List all games         2. List all books            3. List all music albums'
    puts '4. List all genres        5. List all labels           6. List all authors '
    puts '7. Add a book             8. Add a music album         9. Add a game'
    puts '0. Quit'
  end
end
