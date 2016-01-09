module DiceGame
  require './utils'

  class DiceSet
    attr_reader :values

    def initialize()
      # Constructor code here
      @values = []
    end

    def roll(size)
      clear
      (1..size).each do |el|
        @values.push Utils.get_rand 1, 6
      end
    end

    def clear
      @values = []
    end
  end
end