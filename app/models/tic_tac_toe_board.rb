class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game

  # has_many :players

  def self.register_turn(game)
    binding.pry
    puts 'debug'
  end

end
