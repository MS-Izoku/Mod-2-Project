class Like < ApplicationRecord
    belongs_to :user
    belongs_to :progress_update
end
