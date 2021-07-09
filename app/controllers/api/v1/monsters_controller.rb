class Api::V1::MonstersController < ApplicationController

    skip_before_action :authorized, only: [:index]

    def index
        monsters = Monster.all.map{|m| MonsterSerializer.new(m)}
        render json: {monsters: monsters}, status: :accepted
    end
end
