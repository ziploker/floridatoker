class Feedback < ActiveRecord::Base

	validates :name, presence: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :body, presence: true


end
