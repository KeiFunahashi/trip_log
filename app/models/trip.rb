class Trip < ApplicationRecord
  belongs_to :user
  has_many :posts, inverse_of: :trip

  accepts_nested_attributes_for :posts
  
end
