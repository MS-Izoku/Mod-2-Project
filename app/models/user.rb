class User < ApplicationRecord
    has_secure_password
    
    has_many :likes
    has_many :comments
    has_many :user_goals
    #has_many :progress_updates , through: :user_goals
    has_many :goals , through: :user_goals

    def like_count
        self.likes.count
    end

    def comment_count
        self.comments.count
    end
end
