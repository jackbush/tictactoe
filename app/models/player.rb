class Player < ActiveRecord::Base

  has_many :tic_tac_toe_moves
  has_many :tic_tac_toe_boards, through: :tic_tac_toe_moves

  def admin?
    self.role == 'admin'
  end
  
end
