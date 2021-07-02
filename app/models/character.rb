class Character < ApplicationRecord
    has_many :user_characters
    has_many :users, through: :user_characters
    has_many :skills
    serialize :base_stats
end
