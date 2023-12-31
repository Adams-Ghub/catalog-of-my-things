require_relative 'app'
require_relative 'helpers/options'

def main
  app = App.new
  app.load

  options = Options.new

  loop do
    options.choices
    puts 'Enter an option'
    input = gets.chomp.to_i
    break app.save puts if input.zero?

    app.executors(input)
  end
end

main
