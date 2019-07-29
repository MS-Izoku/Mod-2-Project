class UserGoal < ApplicationRecord
    belongs_to :user
    belongs_to :goal
    has_many :progress_updates

    def self.frequency_options
        ["Daily" , "Weekly"]
    end

    def set_complete
        # self.completion = true
        # ProgressUpdate.create(content: "Task Completed" , user_goal_id: self.id)
    end

    def users_with_completion(goal_id)
        # UserGoal.where(completion: true , goal_id: goal_id) # get the users with "completion: true"
    end

    def self.daily_reset
        # it should reset the daily goals of users
        UserGoal.where(frequency: "Daily" , completion: true).all.update(completion: false)
    end

    def self.sweekly_reset
        # it should rest the weeky goals of the users , stretch goal
    end
end
