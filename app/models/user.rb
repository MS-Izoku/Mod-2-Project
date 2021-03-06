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
       
    def post_count
        self.progress_updates.count
    end

    def comment_count
        self.comments.count
    end
    
    def self.languages
        %w(Ruby Javascript Java Python C C++ C# SQL R Go Scala Rust)
    end

end
