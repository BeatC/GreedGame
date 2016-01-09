module DiceGame
  require './player'

  # Class representing Greed game
  class Game
    attr_reader :is_started
    attr_reader :players
    attr_reader :max_score

    def initialize
      @is_started = false
      @players = Array.new
      @max_score = 0
      @round = 0
    end

    def add_player(player)
      @players.push player
    end

    def kick_player(player)
      @players = @players.select { |el| el != player}
    end

    def start
      @is_started = true unless @is_started
    end

    def has_finished
      true if @max_score > 3000
    end

    def next_round
      if @is_started
        @round += 1
        puts "Welcome to the round No.#{@round}!\n"
        @players.each do |player|
          player.roll
          @max_score = player.score if player.score > @max_score

          # Log results of each player
          puts player
        end

        puts "So, the maximum score for this round is: #{@max_score}"
        if has_finished
          winners = players.select { |player| player.score > 3000 }
          puts "Congratulations! We have the winner!"
          winners.each do |winner|
            puts "Winner: #{winner}"
          end
        end
      else
        puts 'You should start the game first!'
      end
    end
  end
end