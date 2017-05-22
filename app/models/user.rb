class User < ApplicationRecord
	has_secure_password
	has_many :posts

  has_many :followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Following', :foreign_key => 'follower_id' 
end
