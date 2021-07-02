class Character < ApplicationRecord
    has_many :skills
    has_many :user_characters
    has_many :users, through: :user_characters
    serialize :base_stats
end
