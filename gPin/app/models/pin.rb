class Pin < ActiveRecord::Base
	validates :url, :comment, presence: true
end
