class ProgressUpdate < ApplicationRecord
    belongs_to :user_goal
    has_many :likes
    has_many :comments

    has_many :users , through: :comments

    def like_count  # we can use this to sort later
        self.likes.count
    end

    def comment_count   # we can use this to sort later
        self.comments.count
    end
end
