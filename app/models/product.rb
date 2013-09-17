class Product < ActiveRecord::Base
	validates :description, :title, :presence => true
	validates :price, :numericality => {:only_integer => true }


	def formatted_price
		"$" + price_in_dollars
	end

	def price_in_dollars
		price_in_dollars = price.to_f/100
		sprintf("%.2f", price_in_dollars)
	end

	def price_in_dollars=(dollars)
		self.price = (dollars.to_f * 100).to_i
	end



end
