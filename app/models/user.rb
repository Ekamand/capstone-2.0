class User < ApplicationRecord
	has_secure_password
	has_many :posts
	# has_many :followers, :class_name => 'Followings', :foreign_key => 'user_id'
 #  	has_many :follows, :class_name => 'Follows', :foreign_key => 'follower_id' 
 # has_many :follows, inverse_of: :user
 #  has_many :followers, through: :follows

 #  has_many :followings, class_name: 'Follow', foreign_key: :follower_id, inverse_of: :follower
 #  has_many :users_i_follow, through: :followings, source: :user

  has_many :followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Following', :foreign_key => 'follower_id' 
end
