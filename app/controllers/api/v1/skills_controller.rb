class Api::V1::SkillsController < ApplicationController

    skip_before_action :authorized, only: :index

    def index
        render json: {skills: Skill.all.map{|s| SkillSerializer.new(s)}}, status: :accepted
    end
end
