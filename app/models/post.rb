class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :categories_posts
	has_many :categories, through: :categories_posts
	has_many :votes, as: :voteable
	
	validates :title, 			presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates	:url, 				presence: true, uniqueness: true

	def total_votes
		self.votes.where(vote: true).size - self.votes.where(vote: false).size
	end

end