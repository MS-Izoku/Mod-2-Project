class UserGoal < ApplicationRecord
    belongs_to :user
    belongs_to :goal
    has_many :progress_updates
end
