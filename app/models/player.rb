class Player < ActiveRecord::Base

  # has_many :tic_tac_toe_boards

  def admin?
    self.role == 'admin'
  end
  
end
