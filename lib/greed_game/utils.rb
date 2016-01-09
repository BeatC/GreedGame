module DiceGame

  class Utils
    def Utils.get_rand(min, max)
      rand(max - min) + min
    end
  end

end