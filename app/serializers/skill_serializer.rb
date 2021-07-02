class SkillSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :effect, :level
end