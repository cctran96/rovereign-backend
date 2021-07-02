class UserCharacterSkillSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user_character
  has_one :skill
end
