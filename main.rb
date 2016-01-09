module DiceGame
  require './player'
  require './game'

  class Application
    def Application.main
      # Define number of players
      puts "Number of players: "
      num_of_players = gets.to_i


      greed_game = Game.new

      # Create players

      (1..num_of_players).each do |num|
        puts "Put the name of a player #{num}:"
        name = gets[0..-2]
        greed_game.add_player Player.new name
      end

      # Start the game
      puts "Press any key to start the game:"
      gets

      # Let's play
      greed_game.start
      until greed_game.has_finished
        greed_game.next_round

        puts "Press any key"
        gets
      end

    end
  end

end


# Start application
DiceGame::Application.main