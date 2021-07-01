class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :usernames]

    def create
        user = User.new(user_params)
        if user.save
            token = encode_token({user_id: user.id})
            render json: {user: UserSerializer.new(user), jwt: token}, status: :created
        else
            render json: {errors: user.errors}, status: :unprocessable_entity
        end
    end

    
    def update
        user = @current_user.update(user_params)
        if user
            render json: {user: UserSerializer.new(@current_user)}, status: :accepted
        else
            render json: {errors: user.errors}, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.permit(:username, :password, :bio)
    end
end
