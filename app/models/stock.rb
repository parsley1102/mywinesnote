class Stock < ApplicationRecord
  belongs_to :user
  validates :wine_name, presence: true, length: { maximum: 255 }
  
end
