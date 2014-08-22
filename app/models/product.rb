class Product < ActiveRecord::Base

	validates :description, presence: true
	validates :name, presence: true
	validates :price_in_cents, 
		presence: true, 
		numericality: {only_integer: true, greater_than: 0}
	has_many :reviews
	has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "100x100#" }
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("$%.2f", price_in_dollars)
	end

	def to_s
		name
	end
end
