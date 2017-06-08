class User < ApplicationRecord
	has_secure_password
	has_many :posts

  has_many :followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Following', :foreign_key => 'follower_id' 

  	def grab_image
		if self.photo
			self.photo
		else 
			return "https://www.isupportcause.com/themes/images/previewImage.png"
		end
	end

end
