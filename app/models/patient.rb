class Patient < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :state

  validates :name, presence: true
  validates :email, presence: true
  
end
