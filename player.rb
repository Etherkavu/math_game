class Player
  attr_reader :score
  def initialize()
    @score = 3
  end

  def to_s
    "Score: #{@score}/3"
  end

  def decrease_score
    @score -= 1
  end
end
