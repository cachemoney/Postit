class User < ActiveRecord::Base
	has_secure_password
	has_many :posts
	has_many :comments
	has_many :votes

	validates :username, presence: :true, uniqueness: true
	validates :password, presence: :true, on: :create

	def already_voted_on_post?(post)
		self.votes.where(voteable_type: "Post", voteable_id: post.id).size > 0
	end
end