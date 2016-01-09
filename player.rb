module DiceGame
  require './dice_set'

  # Class representing Player in the Game
  class Player
    # Property containing score for the current Player instance
    attr_reader :score

    # Property containing Player's name
    attr_reader :name

    # Constructor takes one argument - name of the Player instance
    def initialize(name = 'Unnamed Player')
      @name = name
      @score = 0
      @available_dices = 5
      @dice_set = DiceSet.new
    end

    # Roll dices for the current round and calculates score
    def roll
      @dice_set.clear
      @dice_set.roll(@available_dices)
      calculate_points
    end

    def calculate_points
      numbers = Hash.new 0
      @dice_set.values.each do |el|
        numbers[el] += 1
      end

      available_dices = 0

      @score = (1..6).inject(@score) do |acc, index|
        times = numbers[index]
        triples = times / 3
        triple_modifier = modifier = 0

        # Define modifiers for current number
        case index
          when 1
            triple_modifier = 1000
            modifier = 100
          when 5
            triple_modifier = 500
            modifier = 50
          else
            triple_modifier = index * 100
        end

        times -= triples * 3
        score = acc + triples * triple_modifier + times * modifier

        if modifier == 0
          available_dices += times
        end

        # Return score for further folding
        score
      end

      @available_dices = available_dices == 0 ? 5 : available_dices
    end

    def clear
      @dice_set = DiceSet.clear
    end

    def to_s
      "Player with name '#{@name}' has #{@score} points"
    end

  end
end