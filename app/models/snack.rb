class Snack < ApplicationRecord
  has_many :snack_machines
  has_many :machines, through: :snack_machines

  def self.average_price
    average(:price)
  end
  
end