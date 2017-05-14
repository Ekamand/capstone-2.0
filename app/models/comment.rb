class Comment < ApplicationRecord
	belongs_to :post
	validates :comment_text, presence: true
end
