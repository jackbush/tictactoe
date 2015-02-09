class Board < ActiveRecord::Base
  
  belongs_to :game

  has_many :boards_players, dependent: :destroy
  has_many :players, through: :boards_players

  accepts_nested_attributes_for :boards_players, allow_destroy: true

end
