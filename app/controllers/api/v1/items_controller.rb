class Api::V1::ItemsController < ApplicationController

    skip_before_action :authorized, only: :index

    def index
        render json: {items: Item.all.map{|i| ItemSerializer.new(i)}}, status: :accepted
    end
end
