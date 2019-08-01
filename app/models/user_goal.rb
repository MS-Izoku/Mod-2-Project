class UserGoal < ApplicationRecord
    belongs_to :user
    belongs_to :goal
    has_many :progress_updates

    def self.frequency_options
        ["Daily" , "Weekly"]
    end

    def set_complete
        self.completion = true
        # ProgressUpdate.create(content: "Task Completed" , user_goal_id: self.id)
    end

    def users_with_completion(goal_id)
        UserGoal.where(completion: true , goal_id: goal_id) # get the users with "completion: true"
    end

    def self.reset_completion(freq) # freq is either daily or weekly
        UserGoal.where(frequency: freq.titlecase , completion: true).all.update_all(completion: false)
    end

    def goal_name
        self.goal.name
    end
end
