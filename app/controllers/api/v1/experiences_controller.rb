class Api::V1::ExperiencesController < ApplicationController
    skip_before_action :authorized, only: :index

    def index
        h = {}
        Experience.all.each{|e| h[e.level] = e.exp}
        render json: h, status: :accepted
    end
end
