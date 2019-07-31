class User < ApplicationRecord
    has_many :likes
    has_many :comments
    has_many :user_goals, dependent: :destroy
    has_many :progress_updates , through: :user_goals
    has_many :goals , through: :user_goals
    has_secure_password 
    validates :username, presence: true, uniqueness: true 
    validates :img_url, presence: true 
    validates :full_name, presence: true 
    


    def like_count
        self.likes.count
    end

    def comment_count
        self.comments.count
    end
    
    def self.languages
        %w(Ruby Javascript HTML)
    end

end 
