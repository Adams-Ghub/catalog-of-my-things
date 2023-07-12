require 'date'
require 'item'

class Game < Item 
    def initialize(multiplayer, last_played_at)
        super()
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    private
    def can_be_archived?
        Date.today.year-Date.parse(@last_played_at).year>2 && super
    end
end