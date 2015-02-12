class Player < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tic_tac_toe_boards

  validates :username, presence: true, uniqueness: true
  mount_uploader :avatar, AvatarUploader

  def admin?
    self.role == 'admin'
  end
  
end
