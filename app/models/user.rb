class User < ApplicationRecord
    has_secure_password
    
    has_many :likes
    has_many :comments
    has_many :user_goals
    has_many :progress_updates , through: :user_goals
    has_many :goals , through: :user_goals
    has_secure_password 
    validates :username, presence: true, uniqueness: true 
    validates :img_url, presence: true 
    validates :full_name, presence: true 
    # validate :image_type
    # has_one_attached :image


    def like_count
        self.likes.count
    end

    def comment_count
        self.comments.count
    end

end 
