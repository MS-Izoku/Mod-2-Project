class ProgressUpdate < ApplicationRecord
    belongs_to :user_goal
    has_many :likes
    has_many :comments

    has_many :users , through: :comments
    
end
