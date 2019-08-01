class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :progress_update

    validates :content , length: { minimum: 1 }
end
