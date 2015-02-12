class Player < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tic_tac_toe_boards

  validates :username, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  include Gravtastic
  gravtastic size: 120, default: "identicon"

  def admin?
    self.role == 'admin'
  end

  def self.stats_update(player, squares)
    player.games_played += 1
      if squares.include? 'w'
        player.games_won += 1
      end
    player.save
  end
  
end
