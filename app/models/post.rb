class Post < ApplicationRecord
	geocoded_by :origin

	belongs_to :user
	has_many :comments
	has_many :ratings
	has_many :favorites
	has_many :images

	validates :user_id, presence: true, numericality: true
	validates :title, presence: true
	validates :post_text, presence: true


	def grab_image
		if self.images.length < 1
			return "http://all-natural.com/wp-content/uploads/2015/09/Chinese-Herbs.jpg"
		else 
			self.images.first.img_url
		end
	end



	def geocode(country)
		coordinates = Geocoder.coordinates(country)
		return coordinates
	end



end
