class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :checks
  has_many :restaurants, foreign_key: "owner_id"
  has_many :checked_in_restaurants, through: :checks, source: :restaurant #diner

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end


