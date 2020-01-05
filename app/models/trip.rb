class Trip < ApplicationRecord
  belongs_to :user
  has_many :posts, inverse_of: :trip, dependent: :destroy
  accepts_nested_attributes_for :posts, allow_destroy: true
  
end
