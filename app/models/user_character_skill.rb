class UserCharacterSkill < ApplicationRecord
  belongs_to :user_character
  belongs_to :skill
end
