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

    def goal_completion_status
        if self.user_goal != nil
            self.user_goal.completion
        end
    end

    def find_user_on_update(update)
        update.user_goal.user
    end

    def goal_completion_status=(status)
        # had to monkey patch to account or a nil
        if self.user_goal != nil
            if status == true || status == "1"
                status = true
            else
                status = false
            end

            self.user_goal.completion = status
        end
    end
end
