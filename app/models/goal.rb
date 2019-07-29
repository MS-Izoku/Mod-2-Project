class Goal < ApplicationRecord
    has_many :user_goals
    has_many :progress_updates , through: :user_goals
    has_many :users , through: :user_goals

    def user_count
        self.users.count
    end
end
