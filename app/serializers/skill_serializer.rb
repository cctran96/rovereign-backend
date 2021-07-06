class SkillSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :effect, :level, :character

    def character
        object.character.role
    end
end