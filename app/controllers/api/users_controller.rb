module Api
    class UsersController < ApplicationController
        def index
            users = User.order('created_at DESC');
            render json: {status: 'SUCCESS', data: users}, status: :ok
        end

        def show
            user = User.find(params[:id])
            render json: {status: 'SUCCESS', data: user}, status: :ok
        end

        def create
            user = User.new(user_param)
            if user.save
                render json: {status: 'SUCCESS', message: 'Saved User', data: user}, status: :ok
            else
                render json: {status: 'ERROR', message: 'User not saved',
                data: user.errors}, status: :unprocessable_entity
            end
        end

        def user_param
            params.permit(:username, :email, :password)
        end
    end
end