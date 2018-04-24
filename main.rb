
require_relative 'player'
require 'byebug'

class Game
  attr_reader :players, :prizes
  def initialize(num_of_players)
    @players = (1..num_of_players).map { Player.new }
    start_play
    end_play
  end

  def start_play
    while (players[0].score > 0) && (players[1].score > 0)
      play_round
    end
  end


  def play_round
    round = @players.map.with_index do |player, player_index|
      num_a = 1 + rand(20)
      num_b = 1 + rand(20)
      answer = num_a + num_b
      puts "----- NEW TURN -----"
      puts "Player #{player_index}, what is #{num_a} plus #{num_b} ?"
      player_answer = gets.strip.to_i
      if player_answer == answer
        puts "Player #{player_index}, Yes, you are correct!"
      else
        puts "Seriously? No!"
        player.decrease_score
      end
    end
  end

  def end_play
    if (players[0].score == 0) && (players[1].score == 0)
      puts "You both lose!"
    elsif (players[0].score == 0)
      puts "player 1 wins!"
    elsif (players[1].score == 0)
      puts "player 0 wins!"
    end
  end
end

g = Game.new(2);
