class BoardsPlayer < ActiveRecord::Base

  belongs_to :boards
  belongs_to :players
  
end
