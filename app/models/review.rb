class Review < ActiveRecord::Base
  belongs_to :product
  validates :product_id, :presence => true
  validates :comment, :presence => true 
end
