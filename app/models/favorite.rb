class Favorite < ApplicationRecord
	belongs_to :post
	belongs_to :user
		validates :post_id, uniqueness: true


	def grab_image
		if self.images.length < 1
			return "http://all-natural.com/wp-content/uploads/2015/09/Chinese-Herbs.jpg"
		else 
			self.images.first.img_url
		end
	end
	
end
