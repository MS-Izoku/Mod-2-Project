class UserGoal < ApplicationRecord
    belongs_to :user
    belongs_to :goal
    has_many :progress_updates, dependent: :destroy

    def self.new_for_user(user, params)
        self.new(params).tap do |user_goal|
            user_goal.user = user
        end        
    end

    def self.frequency_options
        ["Daily" , "Weekly"]
    end

    def set_complete
        self.update(completion: true)
    end

    def users_with_completion(goal_id)
        UserGoal.where(completion: true , goal_id: goal_id)
    end

    def self.reset_completion(freq) # freq is either daily or weekly
        UserGoal.where(frequency: freq.titlecase , completion: true).all.update_all(completion: false)
    end

    def goal_name
        self.goal.name
    end
end
