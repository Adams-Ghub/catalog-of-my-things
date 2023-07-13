require_relative 'app'
require_relative 'options'
def main
  app = App.new
  options = Options.new

  loop do
    options.choices
    puts 'Enter an option'
    input = gets.chomp.to_i
    break if input.zero? || input > 13

    app.executors(input)
  end
end

main
