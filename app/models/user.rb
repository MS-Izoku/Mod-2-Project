class User < ApplicationRecord
    has_many :likes
    has_many :comments
    has_many :user_goals
    #has_many :progress_updates , through: :user_goals
    has_many :goals , through: :user_goals
end
