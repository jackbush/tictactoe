class Game < ActiveRecord::Base

  has_many :tic_tac_toe_boards

  validates :name, presence: true, uniqueness: true
  validates :instructions, presence: true

end
