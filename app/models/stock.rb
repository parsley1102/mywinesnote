class Stock < ApplicationRecord
  belongs_to :user
  validates :wine_name, :amount, presence: true, length: { maximum: 255 }
  
end
