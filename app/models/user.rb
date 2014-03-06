class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :checks
  has_many :restaurants, foreign_key: "owner_id"
  has_many :checked_in_restaurants, through: :checks, source: :restaurant #diner

  validates :password, length: { minimum: 3 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true
end


