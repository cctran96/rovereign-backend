class User < ApplicationRecord
    has_secure_password

    has_many :user_characters
    has_many :chracters, through: :user_characters

    validates :password, length: {minimum: 6}
    validates :username, presence: true, uniqueness: { case_sensitive: false }
end
