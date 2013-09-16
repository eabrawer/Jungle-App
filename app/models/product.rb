class Product < ActiveRecord::Base
	validates :description, :title, :presence => true
	validates :price, :numericality => {:only_integer => true }
end
